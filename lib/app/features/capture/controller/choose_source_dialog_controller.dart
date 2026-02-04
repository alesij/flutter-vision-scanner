import 'package:flutter_vision_scanner/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChooseSourceDialogController extends GetxController {
  /// Open the camera to take a photo.
  Future<void> onCameraTap() async {
    // Close dialog.
    Get.back();
    final photo = await ImagePicker().pickImage(source: ImageSource.camera);
    // Cancelled or error.
    if (photo == null) return;

    await Get.toNamed(Routes.processing, arguments: photo.path);
  }

  /// Open the gallery to select an image.
  Future<void> onGalleryTap() async {
    Get.back();
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    await Get.toNamed(Routes.processing, arguments: image.path);
  }
}
