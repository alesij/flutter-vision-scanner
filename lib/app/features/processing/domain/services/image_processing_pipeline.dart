import 'package:flutter_vision_scanner/app/features/scan_result/domain/entities/scan_result.dart';
import 'package:flutter_vision_scanner/app/features/processing/domain/entities/face_detection_data.dart';
import 'package:flutter_vision_scanner/app/features/processing/domain/entities/text_detection_data.dart';

/// Abstract class defining the image processing pipeline interface.
abstract class ImageProcessingPipeline {
  /// Processes the detected faces and returns a [ScanResult] containing the
  /// original and filtered image paths.
  Future<ScanResult> processFaces({required final FaceDetectionData faceData});

  /// Processes the recognized text and returns a [ScanResult] containing the
  /// raw text and an optional path to a processed image.
  Future<ScanResult> processText({required final TextDetectionData textData});
}
