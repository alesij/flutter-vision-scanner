import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_vision_scanner/app/features/scan_result/controller/text_search_controller.dart';

/// Widget that displays the text scan result,
/// including the processed image, the extracted text,
/// and a search bar to filter the text.
class TextScanResultBody extends StatelessWidget {
  /// The raw extracted text from the scanned document.
  final String extractedText;

  /// The file path to the processed image
  /// of the scanned document.
  final String processedImagePath;

  /// Constructor for the TextScanResultBody widget.
  const TextScanResultBody({
    super.key,
    required this.extractedText,
    required this.processedImagePath,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    // Create or find a local GetX controller for this widget.
    // Use a stable tag so we don't register a new controller on every build.
    final tag = 'text_search_${processedImagePath.hashCode}';
    final textSearchController =
        Get.isRegistered<TextSearchController>(tag: tag)
        ? Get.find<TextSearchController>(tag: tag)
        : Get.put(TextSearchController(fullText: extractedText), tag: tag);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Processed document image.
          Container(
            height: 200,
            width: 200,
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.file(File(processedImagePath), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 24),

          // Search bar.
          TextField(
            controller: textSearchController.searchController,
            onChanged: textSearchController.updateSearchQuery,
            decoration: InputDecoration(
              hintText: 'Search in text...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: Obx(() {
                final hasQuery =
                    textSearchController.searchQuery.value.isNotEmpty;
                return hasQuery
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: textSearchController.clearSearch,
                      )
                    : const SizedBox.shrink();
              }),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Extracted text display with selection capability
          Text('Recognized Text:', style: textTheme.titleMedium),
          const SizedBox(height: 8),
          // Static container; only the rich text updates reactively.
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.outline),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Obx(() {
              // Build TextSpan children from highlight ranges (pure data).
              final ranges = textSearchController.highlightRanges.toList();
              final text = textSearchController.fullText;
              final spans = <TextSpan>[];
              int lastIndex = 0;

              for (final range in ranges) {
                // Add non-highlighted text before this range.
                if (range.start > lastIndex) {
                  spans.add(
                    TextSpan(text: text.substring(lastIndex, range.start)),
                  );
                }
                // Add highlighted text.
                spans.add(
                  TextSpan(
                    text: text.substring(range.start, range.end),
                    style: TextStyle(
                      backgroundColor: colorScheme.primary.withAlpha(150),
                    ),
                  ),
                );
                lastIndex = range.end;
              }

              // Add any remaining text after the last range.
              if (lastIndex < text.length) {
                spans.add(TextSpan(text: text.substring(lastIndex)));
              }

              return SelectableText.rich(
                TextSpan(
                  children: spans.isEmpty ? [TextSpan(text: text)] : spans,
                ),
                selectionColor: colorScheme.primary.withAlpha(50),
                cursorColor: colorScheme.primary,
              );
            }),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
