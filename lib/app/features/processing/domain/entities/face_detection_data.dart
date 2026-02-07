import 'dart:ui';

/// Data class to hold face detection results, including the image path and
/// the list of detected face bounding rectangles.
class FaceDetectionData {
  /// Constructor for FaceDetectionData.
  FaceDetectionData({required this.imagePath, required this.faceRects});

  /// The file path to the original image that was processed for face detection.
  final String imagePath;

  /// A list of rectangles representing the bounding boxes of detected faces
  /// in the original image.
  final List<Rect> faceRects;
}
