import 'dart:ui';

class FaceDetectionData {
  FaceDetectionData({required this.imagePath, required this.faceRects});

  final String imagePath;
  final List<Rect> faceRects;
}
