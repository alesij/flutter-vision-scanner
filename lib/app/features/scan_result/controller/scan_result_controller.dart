import 'dart:io';

import 'package:flutter_vision_scanner/app/core/domain/types/either.dart';
import 'package:flutter_vision_scanner/app/features/home/controller/home_controller.dart';
import 'package:flutter_vision_scanner/app/features/scan_result/domain/entities/scan_result.dart';
import 'package:flutter_vision_scanner/app/core/services/pdf_service.dart';
import 'package:flutter_vision_scanner/app/features/scan_result/domain/usecases/save_scan_result_usecase.dart';
import 'package:flutter_vision_scanner/app/features/scan_result/state/scan_result_state.dart';
import 'package:get/get.dart';

/// Controller for managing scan result display and save operations.
/// Handles state transitions between ready, saving, and error states.
class ScanResultController extends GetxController {
  ScanResultController({
    required SaveScanResultUseCase saveUseCase,
    required PdfService pdfService,
    required ScanResult scanResult,
  }) : _saveUseCase = saveUseCase,
       _pdfService = pdfService,
       _scanResult = scanResult;

  final ScanResult _scanResult;
  final SaveScanResultUseCase _saveUseCase;
  final PdfService _pdfService;

  /// Current state of the scan result screen (ready, saving, or error).
  final state = const ScanResultState.initial().obs;

  /// Flag to indicate if the scan result is currently being saved.
  final RxBool isSaving = false.obs;

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

    state.value = ScanResultState.ready(scanResult: _scanResult);
    state.value = ScanResultState.ready(scanResult: arg);
  }

  /// Open the scan result PDF in an external application.
  Future<void> openPdf() async {
    final imagePath = _scanResult.maybeMap(
      text: (result) => result.processedImagePath,
      orElse: () => null,
    );
    if (imagePath == null) {
      return;
    }

    await _pdfService.openResultPdf(imagePath: imagePath);
  }

  /// Save the scan result to device storage.
  Future<void> saveScanResult() async {
    try {
      isSaving.value = true;

      final saveResult = await _saveUseCase(scanResult: _scanResult);
      final recordInserted = saveResult.when(
        left: (_) => false,
        right: (value) => value,
      );

      if (!recordInserted) {
        state.value = const ScanResultState.error(
          message: 'Failed to save scan record',
        );
        return;
      }

      // After saving, navigate back to the home screen.
      await Get.find<HomeController>().refreshScans();
      Get.until((route) => route.isFirst);
    } catch (e) {
      state.value = ScanResultState.error(
        message: 'Failed to save scan result: $e',
      );
    } finally {
      /// Clean up any temporary files created during the scan process.
      /// In this case just the original image for face detection,
      /// because the processed image is already saved in the app directory and
      /// must not be used anymore after saving the scan result.
      ///
      _scanResult.mapOrNull(
        faces: (faceResult) {
          File(faceResult.originalImagePath).delete().ignore();
        },
      );
    }
  }
}
