import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

part 'processing_state.freezed.dart';

/// Sealed class representing the processing state of an image.
///
/// States:
/// - [ProcessingState.processing]: Image is being analyzed (face detection, text recognition).
/// - [ProcessingState.successful]: Analysis completed successfully with detected content.
/// - [ProcessingState.error]: Analysis failed with an error message.
@freezed
sealed class ProcessingState with _$ProcessingState {
  /// Processing state indicating image is being analyzed.
  const factory ProcessingState.processing({required final String message}) =
      _Processing;

  /// Successful state with analysis result containing detected faces and/or text.
  const factory ProcessingState.successful({
    final List<Face>? facesDetected,
    final RecognizedText? recognizedText,
  }) = _Successful;

  /// Error state with error message.
  const factory ProcessingState.error({required final String message}) = _Error;
}
