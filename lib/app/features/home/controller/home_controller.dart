import 'package:flutter_vision_scanner/app/core/domain/types/either.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/entities/scan_record.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/repositories/scan_record_repository.dart';
import 'package:flutter_vision_scanner/app/features/home/state/home_page_state.dart';
import 'package:flutter_vision_scanner/app/routes/app_routes.dart';
import 'package:get/get.dart';

/// Controller for the Home page.
class HomeController extends GetxController {
  /// Constructor with required dependencies.
  HomeController({required ScanRecordRepository repository})
    : _repository = repository;

  final ScanRecordRepository _repository;

  /// Initial state.
  final state = const HomePageState.noScans().obs;

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
      final result = await _repository.getRecentScans();
      result.when(
        /// In case of failure, we can still show the home page with an empty
        /// list of recent scans. This is a safe fallback that allows the app to
        /// remain functional even if there is an issue with loading the recent
        /// scans.
        left: (_) => state.value = const HomePageState.noScans(),
        right: (records) => state.value = records.isEmpty
            ? const HomePageState.noScans()
            : HomePageState.data(items: records),
      );
    } catch (_) {
      state.value = const HomePageState.noScans();
    }
  }

  /// Refresh the list of recent scans by reloading them from the repository.
  Future<void> refreshScans() async {
    final result = await _repository.getRecentScans();
    result.when(
      left: (_) => state.value = const HomePageState.noScans(),
      right: (records) => state.value = records.isEmpty
          ? const HomePageState.noScans()
          : HomePageState.data(items: records),
    );
  }

  /// Delete a scan record and refresh the list of recent scans if the deletion
  /// is successful.
  Future<bool> deleteScanRecord({required ScanRecord record}) async {
    final result = await _repository.deleteScanRecord(scanRecord: record);
    final deleted = result.when(left: (_) => false, right: (value) => value);

    if (deleted) {
      await refreshScans();
    }

    return deleted;
  }

  /// Navigate to the scan details page for the given scan record.
  void navigateToScanDetails({required ScanRecord record}) {
    Get.toNamed(Routes.scanDetail, arguments: record);
  }
}
