import 'dart:io';

import 'package:flutter/material.dart';

/// A mini card widget to display face detection
/// results in the scan result screen.
class FaceScanResultMiniCardWidget extends StatelessWidget {
  /// Title to display above the image.
  final String title;

  /// Path to the image file to display in the card.
  final String imagePath;

  /// Creates a [FaceScanResultMiniCardWidget]
  /// with the given title and image path.
  const FaceScanResultMiniCardWidget({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return AspectRatio(
      aspectRatio: 1.05,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: textTheme.bodyLarge),
            const SizedBox(height: 18),
            Expanded(
              child: Center(
                child: Container(
                  width: 110,
                  height: 110,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(File(imagePath), fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
