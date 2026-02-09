import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vision_scanner/app/core/domain/enums/scan_type.dart';
import 'package:flutter_vision_scanner/app/core/widgets/primary_button.dart';
import 'package:flutter_vision_scanner/app/features/scan_detail/controller/scan_detail_controller.dart';
import 'package:get/get.dart';

/// Screen that shows a scan record with preview and metadata.
class ScanDetailScreen extends GetView<ScanDetailController> {
  const ScanDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('History Detail')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: SizedBox(
                height: 300,
                child: Image.file(
                  File(controller.scanRecord.fileName),
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Center(
                    child: Icon(
                      Icons.broken_image_outlined,
                      color: colorScheme.onSurfaceVariant,
                      size: 48,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            controller.scanRecord.scanType == ScanType.text
                ? PrimaryButton(
                    buttonText: 'Open as PDF',
                    onPressed: controller.openPdfExternally,
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 24),

            _InfoRow(
              label: 'Type',
              value: controller.scanRecord.scanType.displayName,
            ),
            const SizedBox(height: 24),
            _InfoRow(
              label: 'Saved on',
              value: controller.scanRecord.formattedDateLabel,
            ),
            const SizedBox(height: 24),
            _InfoRow(label: 'Size', value: controller.scanRecord.fileSizeLabel),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Text('$label:', style: textTheme.titleLarge),
        const SizedBox(width: 24),
        Expanded(
          child: Text(
            value,
            style: textTheme.titleLarge?.copyWith(color: colorScheme.primary),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
