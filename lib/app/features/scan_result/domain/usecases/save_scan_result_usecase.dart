import 'dart:io';

import 'package:flutter_vision_scanner/app/core/domain/enums/scan_type.dart';
import 'package:flutter_vision_scanner/app/core/domain/types/either.dart';
import 'package:flutter_vision_scanner/app/core/domain/types/failure.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/entities/scan_record.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/repositories/scan_record_repository.dart';
import 'package:flutter_vision_scanner/app/features/scan_result/domain/entities/scan_result.dart';

/// Use case for creating and saving a scan record from a scan result.
class SaveScanResultUseCase {
  SaveScanResultUseCase({required ScanRecordRepository repository})
    : _repository = repository;

  final ScanRecordRepository _repository;

  Future<Either<Failure, bool>> call({required ScanResult scanResult}) async {
    // Extract scan metadata based on scan type.
    final (processedImagePath, scanTypeEnum) = scanResult.map(
      text: (result) => (result.processedImagePath, ScanType.text),
      faces: (result) => (result.filteredImagePath, ScanType.face),
    );

    // Get file size.
    final file = File(processedImagePath);
    final fileSize = await file.length();

    final scanRecord = ScanRecord(
      fileName: processedImagePath,
      scanType: scanTypeEnum,
      formattedDate: DateTime.now(),
      fileSizeBytes: fileSize,
    );

    // Save to database via use case.
    final saveResult = await _repository.saveScanRecord(record: scanRecord);

    final shouldDelete = saveResult.when(
      left: (_) => true,
      right: (value) => !value,
    );

    /// Delete the processed image if saving failed,
    /// to avoid orphaned files and save storage space.
    if (shouldDelete) {
      File(processedImagePath).delete().ignore();
    }

    return saveResult;
  }
}
