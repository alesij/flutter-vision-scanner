import 'dart:io';
import 'dart:math';
import 'package:flutter_vision_scanner/app/core/domain/entities/scan_result.dart';
import 'package:flutter_vision_scanner/app/features/processing/domain/entities/face_detection_data.dart';
import 'package:flutter_vision_scanner/app/features/processing/domain/entities/text_detection_data.dart';
import 'package:flutter_vision_scanner/app/features/processing/services/image_processing_pipeline_impl.dart';
import 'package:image/image.dart' as img;

class ImageProcessingPipelineImpl implements ImageProcessingPipeline {
  /// Process the detected faces by applying a simple filter (grayscale) to each face region.
  /// The processed image is saved to disk and the path is returned in the [ScanResult].
  /// TODO: save all the data into a local database (e.g. Hive). This must be done on done button.
  @override
  Future<ScanResult> processFaces({
    required final FaceDetectionData faceData,
  }) async {
    // Load the original image from disk.
    final bytes = await File(faceData.imagePath).readAsBytes();
    // Decode the image using the image package. This allows us to manipulate the pixels.
    final decoded = img.decodeImage(bytes);
    if (decoded == null) {
      throw Exception('Unable to decode image');
    }

    final out = img.Image.from(decoded);

    // For each detected face, we crop the face region, apply a grayscale filter.
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
      final gray = img.grayscale(
        cropped,
      ); // funzione presente nell'image lib [web:854]

      // Overlay the processed face back onto the original image.
      img.compositeImage(out, gray, dstX: x, dstY: y);
    }

    // Save the processed image to disk with a new name.
    final outPath = _deriveOutputPath(
      faceData.imagePath,
      suffix: '_faces_bw',
      ext: 'jpg',
    );
    final encoded = img.encodeJpg(out, quality: 92);
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
    // Per ora solo placeholder: vedi nota sotto su document edges/perspective/PDF
    return ScanResult.text(rawText: textData.recognizedText.text);
  }

  String _deriveOutputPath(
    String inputPath, {
    required String suffix,
    required String ext,
  }) {
    final file = File(inputPath);
    final dir = file.parent.path;
    final name = file.uri.pathSegments.last.split('.').first;
    return '$dir/$name$suffix.$ext';
  }
}
