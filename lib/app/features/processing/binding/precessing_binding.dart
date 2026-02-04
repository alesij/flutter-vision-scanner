import 'package:flutter_vision_scanner/app/features/processing/controller/processing_controller.dart';
import 'package:get/get.dart';

class ProcessingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProcessingController>(() => ProcessingController());
  }
}
