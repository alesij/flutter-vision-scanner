import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_vision_scanner/app/core/domain/enums/scan_type.dart';

part 'scan_record_dto.freezed.dart';

@freezed
/// DTO for scan records stored in the database.
abstract class ScanRecordDto with _$ScanRecordDto {
  /// Constructor for creating a new scan record DTO.
  const factory ScanRecordDto({
    /// Unique identifier for the scan record (optional, auto-incremented).
    int? id,

    /// File name of the scanned document.
    required String fileName,

    /// Scan type as a string (e.g., "face", "text").
    required String scanType,

    /// Saved timestamp in ISO 8601 format.
    required String savedAt,

    /// File size in bytes.
    required int fileSizeBytes,
  }) = _ScanRecordDto;

  const ScanRecordDto._();

  /// Get the ScanType enum from the scanType string.
  ScanType get scanTypeEnum => ScanType.fromString(scanType) ?? ScanType.text;

  /// Get the saved DateTime from milliseconds.
  DateTime get savedAtDateTime => DateTime.parse(savedAt);

  /// Convert the DTO to a map for database storage.
  Map<String, Object?> toMap() => <String, Object?>{
    'id': id,
    'file_name': fileName,
    'scan_type': scanType,
    'saved_at': savedAt,
    'file_size_bytes': fileSizeBytes,
  };

  /// Create a ScanRecordDto from a map retrieved from the database.
  factory ScanRecordDto.fromMap(Map<String, Object?> map) => ScanRecordDto(
    id: map['id'] as int?,
    fileName: map['file_name'] as String,
    scanType: map['scan_type'] as String,
    savedAt: map['saved_at'] as String,
    fileSizeBytes: (map['file_size_bytes'] as num).toInt(),
  );
}
