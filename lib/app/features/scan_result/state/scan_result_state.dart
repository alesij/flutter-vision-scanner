import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_vision_scanner/app/features/scan_result/domain/entities/scan_result.dart';

part 'scan_result_state.freezed.dart';

@freezed
/// State class for managing the scan result data and status.
class ScanResultState with _$ScanResultState {
  /// Initial state before any processing has started.
  const factory ScanResultState.initial() = _ScanResultStateInitial;

  /// Normal state representing a successful scan result.
  /// Contains a full `ScanResult` instance with all relevant data.
  /// It could be a face detection result or a text recognition result,
  /// depending on the type of scan performed.
  const factory ScanResultState.ready({required ScanResult scanResult}) =
      _ScanResultStateReady;

  /// Safe declaration of error state.
  /// It should never happen, cause the result screen is only shown when
  /// the processing is successful and the scan result is valid.
  const factory ScanResultState.error({required String message}) =
      _ScanResultStateError;
}
