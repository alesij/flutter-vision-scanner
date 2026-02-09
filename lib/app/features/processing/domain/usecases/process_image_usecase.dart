import 'package:flutter_vision_scanner/app/features/processing/domain/entities/face_detection_data.dart';
import 'package:flutter_vision_scanner/app/features/processing/domain/entities/text_detection_data.dart';
import 'package:flutter_vision_scanner/app/features/processing/domain/services/image_processing_pipeline.dart';
import 'package:flutter_vision_scanner/app/features/scan_result/domain/entities/scan_result.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

/// Use case that processes an image and returns a [ScanResult].
class ProcessImageUseCase {
  ProcessImageUseCase({required ImageProcessingPipeline pipeline})
    : _pipeline = pipeline;

  final ImageProcessingPipeline _pipeline;

  /// Process the image and return a [ScanResult].
  /// The [onProgress] callback can be used to report progress messages.
  Future<ScanResult> call({
    required String imagePath,
    required Future<void> Function(String message) onProgress,
  }) async {
    await onProgress('Detecting faces...');

    final inputImage = InputImage.fromFilePath(imagePath);
    final faces = await _detectFaces(inputImage: inputImage);

    if (faces.isNotEmpty) {
      await onProgress('Faces detected, applying face filter...');
      return _pipeline.processFaces(
        faceData: FaceDetectionData(
          imagePath: imagePath,
          faceRects: faces.map((f) => f.boundingBox).toList(),
        ),
      );
    }

    await onProgress('No faces detected, analyzing text...');
    final recognizedText = await _detectText(inputImage: inputImage);

    if (recognizedText.text.trim().isNotEmpty) {
      await onProgress('Text detected, extracting document...');
      return _pipeline.processText(
        textData: TextDetectionData(
          recognizedText: recognizedText,
          imagePath: imagePath,
        ),
      );
    }

    throw Exception('No faces or text detected in the image.');
  }

  Future<List<Face>> _detectFaces({required InputImage inputImage}) async {
    final faceOptions = FaceDetectorOptions(
      enableContours: true,
      performanceMode: FaceDetectorMode.accurate,
    );

    final faceDetector = FaceDetector(options: faceOptions);
    try {
      return await faceDetector.processImage(inputImage);
    } finally {
      await faceDetector.close();
    }
  }

  Future<RecognizedText> _detectText({required InputImage inputImage}) async {
    final textRecognizer = TextRecognizer();
    try {
      return await textRecognizer.processImage(inputImage);
    } finally {
      await textRecognizer.close();
    }
  }
}
