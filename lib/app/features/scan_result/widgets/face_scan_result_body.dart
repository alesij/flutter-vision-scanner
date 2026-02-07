import 'package:flutter/material.dart';
import 'package:flutter_vision_scanner/app/features/scan_result/widgets/face_scan_result_mini_card_widget.dart';

/// Widget that displays the face scan result,
/// showing the original image and the filtered image side by side.
class FaceScanResultBody extends StatelessWidget {
  /// The file path to the original image.
  final String originalPath;

  /// The file path to the filtered image.
  final String filteredPath;

  /// Constructor for the FaceScanResultBody widget.
  const FaceScanResultBody({
    super.key,
    required this.originalPath,
    required this.filteredPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: FaceScanResultMiniCardWidget(
              title: 'Before',
              imagePath: originalPath,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: FaceScanResultMiniCardWidget(
              title: 'After',
              imagePath: filteredPath,
            ),
          ),
        ],
      ),
    );
  }
}
