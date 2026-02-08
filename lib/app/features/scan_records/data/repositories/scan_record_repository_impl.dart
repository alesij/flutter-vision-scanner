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
  Future<Either<Failure, bool>> saveScanRecord(ScanRecordDto record) async {
    return _localDatasource.insertScanRecord(record);
  }
}
