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
  final DateTime formattedDate;

  /// File size in bytes.
  final int fileSizeBytes;

  /// File size formatted for UI display.
  String get fileSizeLabel => _formatFileSize(fileSizeBytes);

  /// Formatted date for UI display.
  String get formattedDateLabel =>
      DateFormat('MMM dd, yyyy HH:mm').format(formattedDate);

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

    return ScanRecord(
      id: dto.id ?? 0,
      fileName: dto.fileName,
      scanType: dto.scanTypeEnum,
      formattedDate: dateTime,
      fileSizeBytes: dto.fileSizeBytes,
    );
  }

  /// Helper method to format file size in a human-readable way (e.g., KB, MB).
  static String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    final kb = bytes / 1024;
    if (kb < 1024) return '${kb.toStringAsFixed(1)} KB';
    final mb = kb / 1024;
    if (mb < 1024) return '${mb.toStringAsFixed(1)} MB';
    final gb = mb / 1024;
    return '${gb.toStringAsFixed(1)} GB';
  }
}
