import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

/// Data class to hold text detection results.
class TextDetectionData {
  /// Constructor for TextDetectionData.
  TextDetectionData({required this.imagePath, required this.recognizedText});

  /// The file path to the original image that was processed
  /// for text recognition.
  final String imagePath;

  /// The full recognized text result from ML Kit.
  final RecognizedText recognizedText;

  /// Convenience getter to access the detected text blocks directly.
  List<TextBlock> get blocks => recognizedText.blocks;

  /// Convenience getter to access the full recognized text as a single string.
  String get rawText => recognizedText.text;
}
