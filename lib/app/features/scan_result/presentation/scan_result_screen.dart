import 'package:flutter/material.dart';
import 'package:flutter_vision_scanner/app/core/domain/entities/scan_result.dart';
import 'package:flutter_vision_scanner/app/features/scan_result/state/scan_result_state.dart';
import 'package:flutter_vision_scanner/app/features/scan_result/widgets/face_scan_result_body.dart';
import 'package:flutter_vision_scanner/app/features/scan_result/widgets/text_scan_result_body.dart';
import 'package:get/get.dart';
import 'package:flutter_vision_scanner/app/features/scan_result/controller/scan_result_controller.dart';

class ScanResultScreen extends GetView<ScanResultController> {
  const ScanResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Result')),
      body: Obx(() {
        return controller.state.value.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          ready: (scanResult) => _buildReadyState(context, scanResult),
          saving: () => _buildSavingState(),
          error: (message) => _buildErrorState(context, message),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.saveScanResult(),
        child: const Text('Done'),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  /// Build ready state UI based on scan result type (faces or text).
  Widget _buildReadyState(BuildContext context, ScanResult scanResult) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: scanResult.when(
        faces: (originalImagePath, filteredImagePath) => FaceScanResultBody(
          originalPath: originalImagePath,
          filteredPath: filteredImagePath,
        ),
        text: (rawText, processedImagePath, pdfPath) => TextScanResultBody(
          extractedText: rawText,
          processedImagePath: processedImagePath,
        ),
      ),
    );
  }

  /// Build saving state with progress indicator.
  Widget _buildSavingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Saving scan result...'),
        ],
      ),
    );
  }

  /// Build error state with error message and back button.
  Widget _buildErrorState(BuildContext context, String message) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: colorScheme.error),
          const SizedBox(height: 16),
          Text(
            'Error',
            style: textTheme.titleLarge?.copyWith(color: colorScheme.error),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back),
            label: const Text('Go Back'),
          ),
        ],
      ),
    );
  }
}
