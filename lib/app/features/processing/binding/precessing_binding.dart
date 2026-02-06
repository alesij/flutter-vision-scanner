import 'package:flutter_vision_scanner/app/features/processing/controller/processing_controller.dart';
import 'package:flutter_vision_scanner/app/features/processing/services/image_processing_pipeline_impl.dart';
import 'package:flutter_vision_scanner/app/features/processing/services/image_processing_pipeline.dart';
import 'package:get/get.dart';

class ProcessingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProcessingController>(() => ProcessingController());
    Get.lazyPut<ImageProcessingPipeline>(() => ImageProcessingPipelineImpl());
  }
}
