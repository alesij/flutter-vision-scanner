import 'dart:io';

import 'package:flutter_vision_scanner/app/core/domain/entities/scan_result.dart';
import 'package:flutter_vision_scanner/app/core/domain/enums/scan_type.dart';
import 'package:flutter_vision_scanner/app/core/domain/models/scan_record_dto.dart';
import 'package:flutter_vision_scanner/app/core/services/file_storage_service.dart';
import 'package:flutter_vision_scanner/app/core/utils/pdf_utils.dart';
import 'package:flutter_vision_scanner/app/features/scan_result/state/scan_result_state.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

/// Controller for managing scan result display and save operations.
/// Handles state transitions between ready, saving, and error states.
class ScanResultController extends GetxController {
  late final ScanResult _scanResult;

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
    _scanResult = arg;
    state.value = ScanResultState.ready(scanResult: _scanResult);
  }

  /// Open the scan result PDF in an external application.
  Future<void> openPdfExternally() async {
    try {
      final imagePath = _scanResult.maybeMap(
        text: (result) => result.processedImagePath,
        orElse: () => null,
      );
      if (imagePath == null) {
        throw Exception('No processed image available');
      }

      final tempPdfPath = await PdfUtils.createTempPdfFromImage(imagePath);

      try {
        await OpenFile.open(tempPdfPath);
      } finally {
        // Clean up the temporary PDF file after opening.
        File(tempPdfPath).delete().ignore();
      }
    } catch (e) {
      throw Exception('Failed to open PDF: $e');
    }
  }

  /// Save the scan result to device storage.
  Future<void> saveScanResult() async {
    try {
      isSaving.value = true;

      // Extract scan metadata based on scan type.
      final (processedImagePath, scanTypeEnum) = _scanResult.map(
        text: (result) => (result.processedImagePath, ScanType.text),
        faces: (result) => (result.filteredImagePath, ScanType.face),
      );

      // Get file size.
      final file = File(processedImagePath);
      final fileSize = await file.length();

      // Create DTO with scan metadata.
      final scanRecordDto = ScanRecordDto(
        fileName: processedImagePath,
        scanType: scanTypeEnum.value,
        savedAt: DateTime.now().toIso8601String(),
        fileSizeBytes: fileSize,
      );

      // Save to database
      final storageService = FileStorageService();
      final recordInserted = await storageService.writeScanRecord(
        scanRecordDto,
      );

      if (!recordInserted) {
        File(processedImagePath).delete().ignore();
        state.value = const ScanResultState.error(
          message: 'Failed to save scan record',
        );
        return;
      }

      // After saving, navigate back to the home screen.
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

  @override
  void onClose() {
    /// Clean up any temporary files created during the scan process.
    /// The imagePath are already temporary because they
    /// are created by ImagePicker,
    _scanResult.when(
      text: (rawText, processedImagePath) {
        File(processedImagePath).delete().ignore();
      },
      faces: (originalImagePath, filteredImagePath) {
        File(originalImagePath).delete().ignore();
        File(filteredImagePath).delete().ignore();
      },
    );
    super.onClose();
  }
}
