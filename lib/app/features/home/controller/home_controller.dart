import 'package:get/get.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;

  // For now fake: will become ScanRecord model + repository in the future
  final recentScans = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadRecentScans();
  }

  Future<void> loadRecentScans() async {
    isLoading.value = true;
    try {
      // TODO: retrieve from storage/db
      await Future.delayed(const Duration(milliseconds: 300));
      recentScans.assignAll([]);
    } finally {
      isLoading.value = false;
    }
  }

  void onTapNewScan() {
    // TODO: open "Choose source" modal (feature/capture)
  }
}
