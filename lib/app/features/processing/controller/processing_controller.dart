import 'package:flutter_vision_scanner/app/core/domain/entities/scan_result.dart';
import 'package:flutter_vision_scanner/app/features/processing/domain/entities/face_detection_data.dart';
import 'package:flutter_vision_scanner/app/features/processing/domain/entities/text_detection_data.dart';
import 'package:flutter_vision_scanner/app/features/processing/services/image_processing_pipeline.dart';
import 'package:flutter_vision_scanner/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import 'package:flutter_vision_scanner/app/features/processing/state/processing_state.dart';

/// Controller for image processing
/// using ML Kit face detection and text recognition.
/// Manages three states: processing, successful, and error.
class ProcessingController extends GetxController {
  /// Path of the image to be processed, passed as a navigation argument.
  String? imagePath;

  /// Image processing pipeline service, injected via GetX dependency injection.
  final ImageProcessingPipeline imageProcessingPipeline =
      Get.find<ImageProcessingPipeline>();

  /// Current state of the image processing.
  final state = const ProcessingState.processing(
    message: 'Analyzing image...',
  ).obs;

  @override
  void onInit() {
    super.onInit();

    // Safely retrieve the image path from the navigation arguments.
    // If the path is missing or invalid, set the state to error.
    final args = Get.arguments;

    if (args is! String || args.trim().isEmpty) {
      state.value = const ProcessingState.error(message: 'Missing image path');
      return;
    }

    imagePath = args;
    analyzeImage();
  }

  /// Analyzes the image using
  /// Google ML Kit face detection and text recognition.
  Future<void> analyzeImage() async {
    final imageToAnalyze = imagePath;
    if (imageToAnalyze == null) {
      state.value = const ProcessingState.error(message: 'Invalid image path');
      return;
    }

    final inputImage = InputImage.fromFilePath(imageToAnalyze);

    try {
      // Update state to detail the current processing step and progress.
      state.value = const ProcessingState.processing(
        message: 'Detecting faces...',
      );

      // First step: detect faces if exist.
      final faces = await _detectFaces(inputImage: inputImage);

      // Just wait some seconds to let the user see the processing state.
      await Future.delayed(const Duration(seconds: 2));

      // Determine the result based on detected content.
      final hasFaces = faces.isNotEmpty;

      // If faces are detected, we can apply the face filter
      // and skip text recognition.
      if (hasFaces) {
        // Update the state to indicate that we're now analyzing text.
        state.value = const ProcessingState.processing(
          message: 'Faces detected, applying face filter...',
        );

        try {
          final scanResult = await _applyFaceFilter(
            originalImagePath: imageToAnalyze,
            faces: faces,
          );

          await Get.offNamed(Routes.result, arguments: scanResult);
        } catch (e) {
          state.value = const ProcessingState.error(
            message:
                'Error applying face filter.\nTry to capture the imagev in '
                'better lighting conditions or '
                'with a clearer view of the face.',
          );
        }

        return;
      }

      // Update the state to indicate that we're now analyzing text.
      state.value = const ProcessingState.processing(
        message: 'No faces detected, analyzing text...',
      );

      // Proceed with text recognition.
      final recognizedText = await _detectText(inputImage: inputImage);

      // Just wait some seconds to let the user see the processing state.
      await Future.delayed(const Duration(seconds: 2));

      final hasText = recognizedText.text.trim().isNotEmpty;

      if (hasText) {
        // Update the state to indicate that we're now analyzing text.
        state.value = const ProcessingState.processing(
          message: 'Text detected, extracting document...',
        );
        try {
          final scanResult = await _applyDocumentFilter(
            originalImagePath: imageToAnalyze,
            recognizedText: recognizedText,
          );

          await Get.offNamed(Routes.result, arguments: scanResult);
        } catch (e) {
          state.value = ProcessingState.error(message: '$e');
        }

        return;
      }

      state.value = const ProcessingState.error(
        message: 'No faces or text detected in the image.',
      );
    } catch (e) {
      state.value = ProcessingState.error(
        message: 'Error processing image: $e',
      );
    }
  }

  // Detect faces and close the detector internally.
  Future<List<Face>> _detectFaces({required InputImage inputImage}) async {
    final faceOptions = FaceDetectorOptions(
      enableContours: true,
      performanceMode: FaceDetectorMode.accurate,
    );

    final faceDetector = FaceDetector(options: faceOptions);
    try {
      final faces = await faceDetector.processImage(inputImage);
      return faces;
    } finally {
      await faceDetector.close();
    }
  }

  // Face filter func.
  Future<ScanResult> _applyFaceFilter({
    required String originalImagePath,
    required List<Face> faces,
  }) async {
    // Estract face rects to pass to the image processing pipeline.
    final facesRects = faces.map((f) => f.boundingBox).toList();

    return await imageProcessingPipeline.processFaces(
      faceData: FaceDetectionData(
        imagePath: originalImagePath,
        faceRects: facesRects,
      ),
    );
  }

  // Detect text and close the recognizer internally.
  Future<RecognizedText> _detectText({required InputImage inputImage}) async {
    final textRecognizer = TextRecognizer();
    try {
      final recognizedText = await textRecognizer.processImage(inputImage);
      return recognizedText;
    } finally {
      await textRecognizer.close();
    }
  }

  // Document filter func.
  Future<ScanResult> _applyDocumentFilter({
    required String originalImagePath,
    required RecognizedText recognizedText,
  }) async {
    return await imageProcessingPipeline.processText(
      textData: TextDetectionData(
        recognizedText: recognizedText,
        imagePath: originalImagePath,
      ),
    );
  }

  /// Navigate back to the previous screen.
  void goBack() {
    Get.back();
  }
}
