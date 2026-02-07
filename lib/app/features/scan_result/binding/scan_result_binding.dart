import 'package:flutter_vision_scanner/app/features/scan_result/controller/scan_result_controller.dart';
import 'package:get/get.dart';

/// Binding class for the Scan Result feature.
class ScanResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanResultController>(() => ScanResultController());
  }
}
