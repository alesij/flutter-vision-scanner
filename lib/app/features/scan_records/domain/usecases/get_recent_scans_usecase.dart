import 'package:flutter_vision_scanner/app/core/domain/types/either.dart';
import 'package:flutter_vision_scanner/app/core/domain/types/failure.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/entities/scan_record.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/repositories/scan_record_repository.dart';

/// Use case for retrieving recent scan records.
class GetRecentScansUseCase {
  GetRecentScansUseCase({required ScanRecordRepository repository})
    : _repository = repository;

  final ScanRecordRepository _repository;

  Future<Either<Failure, List<ScanRecord>>> call() async {
    return _repository.getRecentScans();
  }
}
