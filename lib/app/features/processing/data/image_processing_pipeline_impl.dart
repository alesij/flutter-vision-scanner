import 'dart:io';
import 'dart:math';
import 'package:flutter_vision_scanner/app/features/scan_result/domain/entities/scan_result.dart';
import 'package:flutter_vision_scanner/app/core/utils/storage_paths.dart';
import 'package:flutter_vision_scanner/app/features/processing/domain/entities/face_detection_data.dart';
import 'package:flutter_vision_scanner/app/features/processing/domain/entities/text_detection_data.dart';
import 'package:flutter_vision_scanner/app/features/processing/domain/services/image_processing_pipeline.dart';
import 'package:image/image.dart' as img;

import 'package:opencv_dart/opencv_dart.dart' as cv;

/// Implementation of the [ImageProcessingPipeline].
class ImageProcessingPipelineImpl implements ImageProcessingPipeline {
  /// Process the detected faces by applying a simple filter (grayscale)
  /// to each face region.
  /// The processed image is saved to disk and the path is
  /// returned in the [ScanResult].
  @override
  Future<ScanResult> processFaces({
    required final FaceDetectionData faceData,
  }) async {
    // Load the original image from disk.
    final bytes = await File(faceData.imagePath).readAsBytes();
    // Decode the image using the image package. This allows us to manipulate
    // the pixels.
    final decoded = img.decodeImage(bytes);
    if (decoded == null) {
      throw Exception('Unable to decode image');
    }

    final out = img.Image.from(decoded);

    // For each detected face, we crop the face region,
    // apply a grayscale filter.
    for (final r in faceData.faceRects) {
      // Ensure the rectangle is within the image bounds.
      final x = max(0, r.left.floor());
      final y = max(0, r.top.floor());
      final w = min(out.width - x, r.width.ceil());
      final h = min(out.height - y, r.height.ceil());
      if (w <= 0 || h <= 0) continue;

      // Crop.
      final cropped = img.copyCrop(out, x: x, y: y, width: w, height: h);

      // Grayscale.
      final gray = img.grayscale(cropped);

      // Overlay the processed face back onto the original image.
      img.compositeImage(out, gray, dstX: x, dstY: y);
    }

    // Save the processed image to disk with a new name.
    final outPath = await _deriveOutputPath(
      faceData.imagePath,
      suffix: '_faces_bw',
      ext: 'jpg',
    );

    final encoded = img.encodeJpg(out, quality: 92);
    // Write the processed image to disk.
    await File(outPath).writeAsBytes(encoded);

    return ScanResult.faces(
      originalImagePath: faceData.imagePath,
      filteredImagePath: outPath,
    );
  }

  @override
  Future<ScanResult> processText({
    required final TextDetectionData textData,
  }) async {
    // Load the original image from disk.
    final bytes = await File(textData.imagePath).readAsBytes();

    // 1) Decode bytes -> Mat (BGR).
    final imageBGR = cv.imdecode(bytes, cv.IMREAD_COLOR);

    if (imageBGR.isEmpty) {
      throw Exception('Error decoding image');
    }

    // 2) Edge detection.
    final detectedCorners = _detectDocumentCorners(imageBGR);

    // 3) Perspective correction (warp) to get a top-down view of the document.
    final warped = _warpToQuad(imageBGR, detectedCorners);

    // 4) Contrast enhancement for better readability
    // (grayscale + histogram equalization).
    final enhanced = _enhanceForReadability(warped);

    // Save the processed image to disk with a new name.
    final outPath = await _deriveOutputPath(
      textData.imagePath,
      suffix: '_processed',
      ext: 'jpg',
    );

    // Encode the processed Mat back to bytes (JPEG format).
    final (ok, jpgBytes) = cv.imencode('.jpg', enhanced);
    if (!ok) throw Exception('Error encoding processed image');

    // Write the processed image to disk.
    await File(outPath).writeAsBytes(jpgBytes);

    return ScanResult.text(
      rawText: textData.recognizedText.text,
      processedImagePath: outPath,
    );
  }

  /// Returns the corners of the detected document in the image.
  List<cv.Point> _detectDocumentCorners(cv.Mat bgr) {
    // 1) Grayscale.
    final grayImage = cv.cvtColor(bgr, cv.COLOR_BGR2GRAY);

    // 2) Denoise / Blur.
    final blurred = cv.bilateralFilter(grayImage, 9, 75, 75);

    // 3) Canny on the blurred image to get edges.
    final bin = cv.threshold(
      blurred,
      0,
      255,
      cv.THRESH_BINARY | cv.THRESH_OTSU,
    );

    final edges2 = cv.canny(bin.$2, 50, 150);

    // 4) After edge detection, we apply a morphological closing
    // operation to connect nearby edges and fill small gaps.

    // Closing: dilate followed by erode.
    // This helps to connect edges that belong to the same contour,
    // making it more likely to find a
    // complete quadrilateral around the document.
    final k = max(3, (min(bgr.cols, bgr.rows) * 0.01).round() | 1); // dispari
    final kernel = cv.getStructuringElement(cv.MORPH_RECT, (k, k));
    final closed = cv.morphologyEx(edges2, cv.MORPH_CLOSE, kernel);

    // 5) Contours.
    final (contours, _) = cv.findContours(
      closed,
      cv.RETR_EXTERNAL,
      cv.CHAIN_APPROX_SIMPLE,
    );

    if (contours.isEmpty) {
      throw Exception('No contours found.');
    }

    // 6) Take the largest contour that approximates to a quadrilateral.
    cv.VecPoint? bestQuad;
    double bestArea = 0;

    // Order contours by area (descending) to prioritize larger ones,
    // which are more likely to be the document.
    // This is a common heuristic in document scanning apps.
    // We can break early once we find a good quadrilateral,
    // since it's unlikely that smaller contours will be better candidates.
    final sortedContours = contours.toList()
      ..sort((a, b) => cv.contourArea(b).compareTo(cv.contourArea(a)));

    for (final cnt in sortedContours) {
      final area = cv.contourArea(cnt);
      // Skip small countours that are unlikely to be the document.
      if (area < 10_000) continue;

      // Approximate the contour to a polygon and check
      // if it has 4 points (quadrilateral).
      final peri = cv.arcLength(cnt, true);
      final approx = cv.approxPolyDP(cnt, 0.02 * peri, true);

      if (approx.length == 4 && area > bestArea) {
        bestArea = area;
        bestQuad = approx;
        // Since we sorted by area, we can break after finding the first
        // valid quadrilateral.
        break;
      }
    }

    if (bestQuad == null) {
      throw Exception('No document-like quadrilateral found');
    }

    // 8) Order the 4 points.
    return _order4Points(bestQuad);
  }

  /// Orders the 4 points of a quadrilateral in a consistent way:
  /// [topLeft, topRight, bottomRight, bottomLeft].
  List<cv.Point> _order4Points(cv.VecPoint quadrilateral) {
    final sortedPoints = quadrilateral.toList();

    // TL = min(x+y), BR = max(x+y).
    sortedPoints.sort(
      (pointA, pointB) => (pointA.x + pointA.y).compareTo(pointB.x + pointB.y),
    );
    final topLeft = sortedPoints.first;
    final bottomRight = sortedPoints.last;

    // TR = max(x-y), BL = min(x-y).
    sortedPoints.sort(
      (pointA, pointB) => (pointA.x - pointA.y).compareTo(pointB.x - pointB.y),
    );
    final bottomLeft = sortedPoints.first;
    final topRight = sortedPoints.last;

    return [topLeft, topRight, bottomRight, bottomLeft];
  }

  // Func for warping the detected document to a top-down view.
  // It takes the original BGR image and the 4 corners of the detected document,
  // and applies a perspective transform to “flatten” the document.
  cv.Mat _warpToQuad(cv.Mat bgrImage, List<cv.Point> corners) {
    final topLeft = corners[0],
        topRight = corners[1],
        bottomRight = corners[2],
        bottomLeft = corners[3];

    // Internal helper to calculate distance between two points.
    double calculateDistance(cv.Point pointA, cv.Point pointB) {
      final deltaX = (pointA.x - pointB.x).toDouble();
      final deltaY = (pointA.y - pointB.y).toDouble();
      return sqrt(deltaX * deltaX + deltaY * deltaY);
    }

    // Calculate output dimensions based on detected document edges.
    final widthBottomEdge = calculateDistance(bottomRight, bottomLeft);
    final widthTopEdge = calculateDistance(topRight, topLeft);
    // Take the maximum width to ensure the entire document fits in the output.
    final outputWidth = max(
      widthBottomEdge,
      widthTopEdge,
    ).round().clamp(1, 5000);

    final heightRightEdge = calculateDistance(topRight, bottomRight);
    final heightLeftEdge = calculateDistance(topLeft, bottomLeft);
    final outputHeight = max(
      heightRightEdge,
      heightLeftEdge,
    ).round().clamp(1, 5000);

    // Source points: detected document corners.
    final sourcePoints = cv.VecPoint.fromList([
      topLeft,
      topRight,
      bottomRight,
      bottomLeft,
    ]);

    // Destination points: rectangular output in normalized coordinates.
    final destinationPoints = cv.VecPoint.fromList([
      cv.Point(0, 0),
      cv.Point(outputWidth - 1, 0),
      cv.Point(outputWidth - 1, outputHeight - 1),
      cv.Point(0, outputHeight - 1),
    ]);

    // Calculate and apply perspective transformation matrix.
    final perspectiveMatrix = cv.getPerspectiveTransform(
      sourcePoints,
      destinationPoints,
    );
    return cv.warpPerspective(bgrImage, perspectiveMatrix, (
      outputWidth,
      outputHeight,
    ));
  }

  // Func for enhancing the contrast of the warped document
  // image to improve readability.
  cv.Mat _enhanceForReadability(cv.Mat bgr) {
    final lab = cv.cvtColor(bgr, cv.COLOR_BGR2Lab);
    // Split the Lab image into its channels.
    // The L channel contains the lightness information,
    // which is what we want to enhance for better readability.,
    // The a and b channels contain color information that we want to preserve.
    final channels = cv.split(lab);

    // Apply CLAHE (Contrast Limited Adaptive Histogram Equalization)
    // to the L channel.
    final clahe = cv.createCLAHE(clipLimit: 2.0);
    channels[0] = clahe.apply(channels[0]);

    final merged = cv.merge(channels);
    return cv.cvtColor(merged, cv.COLOR_Lab2BGR);
  }

  Future<String> _deriveOutputPath(
    String inputPath, {
    required String suffix,
    required String ext,
  }) async {
    await StoragePaths.scansDirectory;
    final name = File(inputPath).uri.pathSegments.last.split('.').first;
    final fileName = '$name$suffix.$ext';
    return StoragePaths.fullFilePath(fileName);
  }
}
