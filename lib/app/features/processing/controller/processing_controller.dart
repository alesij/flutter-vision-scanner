import 'package:flutter_vision_scanner/app/features/processing/domain/usecases/process_image_usecase.dart';
import 'package:flutter_vision_scanner/app/routes/app_routes.dart';
import 'package:get/get.dart';

import 'package:flutter_vision_scanner/app/features/processing/state/processing_state.dart';

/// Controller for image processing
/// using ML Kit face detection and text recognition.
/// Manages three states: processing, successful, and error.
class ProcessingController extends GetxController {
  /// Path of the image to be processed, passed as a navigation argument.
  String? imagePath;

  /// Image processing pipeline service, injected via GetX dependency injection.
  final ProcessImageUseCase _processImageUseCase =
      Get.find<ProcessImageUseCase>();

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

    try {
      final scanResult = await _processImageUseCase(
        imagePath: imageToAnalyze,
        onProgress: (message) async {
          state.value = ProcessingState.processing(message: message);
        },
      );

      await Get.offNamed(Routes.result, arguments: scanResult);
    } catch (e) {
      state.value = ProcessingState.error(
        message: 'Error processing image: $e',
      );
    }
  }

  /// Navigate back to the previous screen.
  void goBack() {
    Get.back();
  }
}
