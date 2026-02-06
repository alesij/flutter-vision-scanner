import 'package:freezed_annotation/freezed_annotation.dart';
part 'scan_result.freezed.dart';

@freezed
class ScanResult with _$ScanResult {
  const factory ScanResult.faces({
    required String originalImagePath,
    required String filteredImagePath,
  }) = FacesResult;

  const factory ScanResult.text({
    required String rawText,
    String? processedImagePath,
  }) = TextResult;
}
