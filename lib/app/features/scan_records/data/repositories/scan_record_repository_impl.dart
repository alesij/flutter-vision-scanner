import 'dart:io';

import 'package:flutter_vision_scanner/app/core/utils/storage_paths.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/entities/scan_record.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/data/models/scan_record_dto.dart';
import 'package:flutter_vision_scanner/app/core/domain/types/either.dart';
import 'package:flutter_vision_scanner/app/core/domain/types/failure.dart';
import 'package:flutter_vision_scanner/app/core/utils/map_dto.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/datasources/scan_record_datasource.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/repositories/scan_record_repository.dart';

/// Repository implementation for scan records.
class ScanRecordRepositoryImpl implements ScanRecordRepository {
  /// Constructor with dependency injection for the datasource.
  ScanRecordRepositoryImpl({
    required final ScanRecordDatasource localDatasource,
  }) : _localDatasource = localDatasource;

  final ScanRecordDatasource _localDatasource;

  @override
  Future<Either<Failure, List<ScanRecord>>> getRecentScans() async {
    return mapDtoFuture(
      dto: _localDatasource.readAllScanRecords(),
      data: (dtos) {
        final sortedDtos = [...dtos]
          ..sort((a, b) => b.savedAtDateTime.compareTo(a.savedAtDateTime));
        return sortedDtos.map(ScanRecord.fromDto).toList();
      },
    );
  }

  @override
  Future<Either<Failure, bool>> saveScanRecord({
    required ScanRecord record,
  }) async {
    final recordDto = ScanRecordDto(
      fileName: record.fileName,
      scanType: record.scanType.value,
      savedAt: DateTime.now().toIso8601String(),
      fileSizeBytes: record.fileSizeBytes,
    );
    return _localDatasource.insertScanRecord(record: recordDto);
  }

  @override
  Future<Either<Failure, bool>> deleteScanRecord({
    required int id,
    required String fileName,
  }) async {
    return await _localDatasource.deleteScanRecord(id: id).then((result) {
      return result.when(
        right: (value) async {
          if (value) {
            // If the record is successfully deleted from the database, we can
            // also delete the associated file from storage to free up space.
            // This is a best effort cleanup and we ignore any errors that occur
            // during file deletion, as it should not affect the app's
            // functionality.
            final fullFilePath = await StoragePaths.fullFilePath(fileName);
            try {
              File(fullFilePath).delete().ignore();
            } catch (_) {
              return const Left(
                Failure.generic(message: 'Failed to delete scan file'),
              );
            }
          }
          return Right(value);
        },
        left: (_) {
          // If there was an error deleting the record from the database, we
          // simply return the failure without attempting to delete the file,
          // since the record still exists and we don't want to orphan the file.
          return const Left(
            Failure.generic(message: 'Failed to delete scan record'),
          );
        },
      );
    });
  }
}
