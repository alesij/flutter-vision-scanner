import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import 'package:flutter_vision_scanner/app/features/processing/state/processing_state.dart';

/// Controller for image processing
/// using ML Kit face detection and text recognition.
/// Manages three states: processing, successful, and error.
class ResultController extends GetxController {
  String? imagePath;

  /// Current state of the image processing.
  final state = const ProcessingState.processing(
    message: 'Analyzing image...',
  ).obs;

  @override
  void onInit() {
    super.onInit();

    // Safely retrieve the image path from the navigation arguments. If the path is
    // missing or invalid, set the state to error.
    final args = Get.arguments;

    if (args is! String || args.trim().isEmpty) {
      state.value = const ProcessingState.error(message: 'Missing image path');
      return;
    }

    imagePath = args;
    analyzeImage();
  }

  /// Analyzes the image using Google ML Kit face detection and text recognition.
  /// Updates [state] observable based on the analysis result.
  Future<void> analyzeImage() async {
    final imageToAnalyze = imagePath;
    if (imageToAnalyze == null) {
      state.value = const ProcessingState.error(message: 'Invalid image path');
      return;
    }

    final inputImage = InputImage.fromFilePath(imageToAnalyze);

    final faceOptions = FaceDetectorOptions(
      performanceMode: FaceDetectorMode.accurate,
    );

    final faceDetector = FaceDetector(options: faceOptions);

    // For semplicity, it just works with latin characters.
    final textRecognizer = TextRecognizer();

    try {
      // Update state to detail the current processing step and progress.
      state.value = const ProcessingState.processing(
        message: 'Detecting faces...',
      );

      /// Process the face first.
      final faces = await faceDetector.processImage(inputImage);

      // Just wait some seconds to simulate to let the user see
      // the processing state.
      await Future.delayed(const Duration(seconds: 2));

      // Determine the result based on detected content.
      final hasFaces = faces.isNotEmpty;

      // If faces are detected, we can directly set the successful
      // state with faces and skip text recognition.
      if (hasFaces) {
        state.value = const ProcessingState.processing(
          message: 'Faces detected, finalizing results...',
        );

        // Just wait some seconds to simulate finalization of results.
        await Future.delayed(const Duration(seconds: 2));

        // TODO: move to result screen.
        state.value = ProcessingState.successful(facesDetected: faces);
        return;
      }

      // Update the state to indicate that we're now analyzing text.
      state.value = const ProcessingState.processing(
        message: 'No faces detected, analyzing text...',
      );

      // If no faces, we proceed with text recognition.
      final recognizedText = await textRecognizer.processImage(inputImage);

      // Just wait some seconds to simulate to let the user see
      // the processing state.
      await Future.delayed(const Duration(seconds: 2));

      final hasText = recognizedText.text.trim().isNotEmpty;

      if (hasText) {
        state.value = const ProcessingState.processing(
          message: 'Faces detected, finalizing results...',
        );

        // Just wait some seconds to simulate finalization of results.
        await Future.delayed(const Duration(seconds: 2));

        // TODO: move to result screen.
        state.value = ProcessingState.successful(
          recognizedText: recognizedText,
        );
        return;
      }

      state.value = const ProcessingState.error(
        message: 'No faces or text detected in the image.',
      );
    } catch (e) {
      state.value = ProcessingState.error(
        message: 'Error processing image: $e',
      );
    } finally {
      await faceDetector.close();
      await textRecognizer.close();
    }
  }
}
