import 'package:flutter_vision_scanner/app/core/domain/entities/scan_result.dart';
import 'package:flutter_vision_scanner/app/features/processing/domain/entities/face_detection_data.dart';
import 'package:flutter_vision_scanner/app/features/processing/domain/entities/text_detection_data.dart';

abstract class ImageProcessingPipeline {
  Future<ScanResult> processFaces({required final FaceDetectionData faceData});
  Future<ScanResult> processText({required final TextDetectionData textData});
}
