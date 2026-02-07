import 'package:freezed_annotation/freezed_annotation.dart';
part 'scan_result.freezed.dart';

@freezed
/// Sealed class representing the result of scanning an image,
///  which can be either a face detection result or a text recognition result.
class ScanResult with _$ScanResult {
  /// Factory constructor for a face detection result,
  /// containing paths to the original and filtered images.
  const factory ScanResult.faces({
    required String originalImagePath,
    required String filteredImagePath,
  }) = FacesResult;

  /// Factory constructor for a text recognition result,
  /// containing the raw recognized text
  /// and an optional path to a processed image.
  const factory ScanResult.text({
    required String rawText,
    String? processedImagePath,
  }) = TextResult;
}
