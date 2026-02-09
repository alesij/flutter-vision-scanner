import 'package:flutter_vision_scanner/app/features/scan_records/data/models/scan_record_dto.dart';
import 'package:flutter_vision_scanner/app/core/domain/types/either.dart';
import 'package:flutter_vision_scanner/app/core/domain/types/failure.dart';

/// Contract for scan record datasources.
abstract class ScanRecordDatasource {
  /// Insert a scan record into the datasource.
  Future<Either<Failure, bool>> insertScanRecord({
    required ScanRecordDto record,
  });

  /// Read all scan records from the datasource.
  Future<Either<Failure, List<ScanRecordDto>>> readAllScanRecords();

  /// Delete a scan record by id.
  Future<Either<Failure, bool>> deleteScanRecord({required int id});
}
