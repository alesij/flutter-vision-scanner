import 'package:flutter_vision_scanner/app/features/result/controller/result_controller.dart';
import 'package:get/get.dart';

/// Binding class for the Result feature.
class ResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultController>(() => ResultController());
  }
}
