import 'package:flutter_vision_scanner/app/core/domain/entities/scan_result.dart';
import 'package:flutter_vision_scanner/app/features/scan_result/state/scan_result_state.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

/// Controller for managing scan result display and save operations.
/// Handles state transitions between ready, saving, and error states.
class ScanResultController extends GetxController {
  late final ScanResult _scanResult;

  /// Current state of the scan result screen (ready, saving, or error).
  final state = const ScanResultState.initial().obs;

  @override
  void onInit() {
    super.onInit();
    final arg = Get.arguments;
    if (arg is! ScanResult) {
      /// This should never happen, as the result screen is
      /// only shown when a valid scan result is available.
      /// Safely handle the case where the argument is missing
      /// or of the wrong type by setting an error state.
      state.value = const ScanResultState.error(
        message: 'Was not able to load scan result',
      );
      return;
    }
    _scanResult = arg;
    state.value = ScanResultState.ready(scanResult: _scanResult);
  }

  /// Open the scan result PDF in an external application.
  Future<void> openPdfExternally() async {
    try {
      final pdfPath = _scanResult.maybeWhen(
        text: (rawText, processedImagePath, pdfPath) => pdfPath,
        orElse: () => null,
      );
      await OpenFile.open(pdfPath);
    } catch (e) {
      state.value = ScanResultState.error(message: 'Failed to open PDF: $e');
    }
  }

  /// Save the scan result to device storage.
  Future<void> saveScanResult() async {
    try {
      state.value = const ScanResultState.saving();
      // TODO: Implement actual save logic (store to database/file system)
      await Future.delayed(const Duration(milliseconds: 500));
      state.value = ScanResultState.ready(scanResult: _scanResult);
    } catch (e) {
      state.value = ScanResultState.error(
        message: 'Failed to save scan result: $e',
      );
    }
  }
}
