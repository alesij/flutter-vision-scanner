import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class TextDetectionData {
  TextDetectionData({required this.imagePath, required this.recognizedText});

  final String imagePath;
  final RecognizedText recognizedText;

  /// Convenience getter to access the detected text blocks directly.
  List<TextBlock> get blocks => recognizedText.blocks;

  /// Convenience getter to access the full recognized text as a single string.
  String get rawText => recognizedText.text;
}
