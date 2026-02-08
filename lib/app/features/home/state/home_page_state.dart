import 'package:flutter_vision_scanner/app/features/scan_records/domain/entities/scan_record.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.freezed.dart';

@freezed
/// State class for managing the home page data and status.
class HomePageState with _$HomePageState {
  /// State when there are no recent scans to display or
  /// when the recent scans retrieval fails (e.g., due to a database error).
  const factory HomePageState.noScans() = _NoScans;

  /// Loading state while recent scans are being retrieved.
  const factory HomePageState.loading() = _Loading;

  /// State representing the loaded recent scans.
  /// Contains a list of `ScanRecord` items to be displayed in the UI.
  const factory HomePageState.data({required List<ScanRecord> items}) = _Data;
}
