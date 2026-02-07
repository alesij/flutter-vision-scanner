import 'package:flutter/material.dart';
import 'package:flutter_vision_scanner/app/features/scan_result/widgets/face_scan_result_mini_card_widget.dart';

class FaceScanResultBody extends StatelessWidget {
  final String originalPath;
  final String filteredPath;

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
