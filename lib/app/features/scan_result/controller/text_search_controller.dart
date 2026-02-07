import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller for managing text search and selection in the text result body.
/// Handles filtering, highlighting, and clipboard operations.
class TextSearchController extends GetxController {
  /// Original full extracted text from scan result.
  final String fullText;

  /// Current search query.
  final searchQuery = ''.obs;

  /// Controller for the search `TextField` so we can programmatically clear it.
  final searchController = TextEditingController();

  /// List of highlight ranges (start and end indices) matching the current query.
  /// Does not depend on Flutter UI widgets.
  final highlightRanges = <TextRange>[].obs;

  /// Initialize the controller with the full extracted text.
  TextSearchController({required this.fullText});

  @override
  void onInit() {
    super.onInit();
    highlightRanges.value = [];
    searchController.text = '';
  }

  /// Update search query and compute highlight ranges.
  void updateSearchQuery(String query) {
    searchQuery.value = query;
    highlightRanges.value = _computeHighlightRanges(fullText, query);
  }

  /// Clear search query and reset highlight ranges.
  void clearSearch() {
    searchQuery.value = '';
    highlightRanges.value = [];
    // Clear the linked TextField content.
    searchController.clear();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  /// Compute highlight ranges for a given query in text.
  /// Returns a list of start/end index pairs for matches.
  List<TextRange> _computeHighlightRanges(String text, String query) {
    if (query.isEmpty) return [];
    final lowerText = text.toLowerCase();
    final lowerQuery = query.toLowerCase();
    final ranges = <TextRange>[];
    int index = lowerText.indexOf(lowerQuery);

    while (index != -1) {
      ranges.add(TextRange(start: index, end: index + query.length));
      index = lowerText.indexOf(lowerQuery, index + query.length);
    }

    return ranges;
  }
}
