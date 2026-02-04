import 'package:flutter_vision_scanner/app/features/capture/controller/choose_source_dialog_controller.dart';
import 'package:flutter_vision_scanner/app/features/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ChooseSourceDialogController>(
      () => ChooseSourceDialogController(),
    );
  }
}
