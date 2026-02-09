import 'package:flutter_vision_scanner/app/features/scan_records/domain/entities/scan_record.dart';
import 'package:flutter_vision_scanner/app/core/domain/types/either.dart';
import 'package:flutter_vision_scanner/app/core/domain/types/failure.dart';

/// Contract for scan record repositories.
abstract class ScanRecordRepository {
  /// Get all scan records ordered by saved date (desc).
  Future<Either<Failure, List<ScanRecord>>> getRecentScans();

  /// Save a scan record.
  Future<Either<Failure, bool>> saveScanRecord({required ScanRecord record});

  /// Delete a scan record by id.
  Future<Either<Failure, bool>> deleteScanRecord({
    required int id,
    required String fileName,
  });
}
