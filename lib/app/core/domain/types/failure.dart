import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Represents a failure in the application, typically used to handle errors
/// that occur during operations such as network requests, data processing, etc.
/// For simplicity, it will only be related to db issues.
@freezed
abstract class Failure with _$Failure {
  /// Generic failure type with optional message, body, code, and stack trace.
  const factory Failure.generic({
    /// Error message describing the failure.
    @Default('An unexpected error occurred') final String message,

    /// Optional body with additional error details.
    final String? body,

    /// Optional error code.
    final String? code,

    /// Optional stack trace for debugging.
    final StackTrace? strackTrace,
  }) = _GenericFailure;

  /// Private constructor for Failure.
  const Failure._();
}
