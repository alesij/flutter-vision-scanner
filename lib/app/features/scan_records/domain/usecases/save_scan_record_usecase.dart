import 'package:flutter_vision_scanner/app/features/scan_records/data/models/scan_record_dto.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/repositories/scan_record_repository.dart';
import 'package:flutter_vision_scanner/app/core/domain/types/either.dart';
import 'package:flutter_vision_scanner/app/core/domain/types/failure.dart';

/// Use case for saving a scan record.
class SaveScanRecordUseCase {
  SaveScanRecordUseCase({required ScanRecordRepository repository})
    : _repository = repository;

  final ScanRecordRepository _repository;

  Future<Either<Failure, bool>> call(ScanRecordDto record) async {
    return _repository.saveScanRecord(record);
  }
}
