import 'package:flutter/foundation.dart';
import 'package:flutter_vision_scanner/app/core/domain/enums/scan_type.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/data/models/scan_record_dto.dart';
import 'package:intl/intl.dart';

/// Entity representing a scan record for UI display.
@immutable
class ScanRecord {
  /// Unique identifier for the scan record.
  final int? id;

  /// File path to the processed image.
  final String fileName;

  /// Type of scan: face or text.
  final ScanType scanType;

  /// Formatted timestamp for UI display.
  final String formattedDate;

  /// File size in bytes.
  final int fileSizeBytes;

  /// Constructor for creating a ScanRecord with all required fields.
  const ScanRecord({
    this.id,
    required this.fileName,
    required this.scanType,
    required this.formattedDate,
    required this.fileSizeBytes,
  });

  /// Create a ScanRecord from a DTO, formatting display values for UI.
  factory ScanRecord.fromDto(ScanRecordDto dto) {
    // Format the saved timestamp for display
    final dateTime = DateTime.parse(dto.savedAt);
    final formattedDate = DateFormat('MMM dd, yyyy HH:mm').format(dateTime);

    return ScanRecord(
      id: dto.id ?? 0,
      fileName: dto.fileName,
      scanType: dto.scanTypeEnum,
      formattedDate: formattedDate,
      fileSizeBytes: dto.fileSizeBytes,
    );
  }
}
