import 'package:flutter_vision_scanner/app/core/domain/types/either.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/usecases/get_recent_scans_usecase.dart';
import 'package:flutter_vision_scanner/app/features/home/state/home_page_state.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  /// Initial state.
  final state = const HomePageState.initial().obs;

  @override
  void onInit() {
    super.onInit();

    loadScans();
  }

  /// Load all the scan records from the repository
  /// and update the state accordingly.
  Future<void> loadScans() async {
    state.value = const HomePageState.loading();
    try {
      final result = await Get.find<GetRecentScansUseCase>()();
      result.when(
        /// In case of failure, we can still show the home page with an empty
        /// list of recent scans. This is a safe fallback that allows the app to
        /// remain functional even if there is an issue with loading the recent
        /// scans.
        left: (_) => state.value = const HomePageState.data(items: []),
        right: (records) => state.value = HomePageState.data(items: records),
      );
    } catch (_) {
      state.value = const HomePageState.data(items: []);
    }
  }
}
