import 'package:flutter_vision_scanner/app/features/processing/controller/processing_controller.dart';
import 'package:flutter_vision_scanner/app/features/processing/data/image_processing_pipeline_impl.dart';
import 'package:flutter_vision_scanner/app/features/processing/domain/services/image_processing_pipeline.dart';
import 'package:flutter_vision_scanner/app/features/processing/domain/usecases/process_image_usecase.dart';
import 'package:get/get.dart';

/// Binding class for the Processing feature.
class ProcessingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImageProcessingPipeline>(() => ImageProcessingPipelineImpl());
    Get.lazyPut<ProcessImageUseCase>(
      () => ProcessImageUseCase(pipeline: Get.find<ImageProcessingPipeline>()),
    );
    Get.lazyPut<ProcessingController>(
      () => ProcessingController(
        processImageUseCase: Get.find<ProcessImageUseCase>(),
      ),
    );
  }
}
