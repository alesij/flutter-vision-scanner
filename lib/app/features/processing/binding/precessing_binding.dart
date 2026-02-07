import 'package:flutter_vision_scanner/app/features/processing/controller/processing_controller.dart';
import 'package:flutter_vision_scanner/app/features/processing/services/image_processing_pipeline_impl.dart';
import 'package:flutter_vision_scanner/app/features/processing/services/image_processing_pipeline.dart';
import 'package:get/get.dart';

/// Binding class for the Processing feature.
class ProcessingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImageProcessingPipeline>(() => ImageProcessingPipelineImpl());
    Get.lazyPut<ProcessingController>(() => ProcessingController());
  }
}
