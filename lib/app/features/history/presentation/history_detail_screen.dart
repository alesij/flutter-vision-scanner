import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vision_scanner/app/core/services/pdf_service.dart';
import 'package:flutter_vision_scanner/app/core/widgets/primary_button.dart';
import 'package:flutter_vision_scanner/app/features/scan_records/domain/entities/scan_record.dart';
import 'package:open_file/open_file.dart';

/// Screen that shows a scan record with preview and metadata.
class HistoryDetailScreen extends StatelessWidget {
  final ScanRecord record;
  const HistoryDetailScreen({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isPdf = record.fileName.toLowerCase().endsWith('.pdf');

    return Scaffold(
      appBar: AppBar(title: const Text('History Detail')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: _PreviewCard(record: record, isPdf: isPdf),
              ),
            ),
            const SizedBox(height: 16),
            _MetadataCard(record: record),
            const SizedBox(height: 16),
            if (isPdf)
              PrimaryButton(
                buttonText: 'Open PDF',
                onPressed: () async {
                  await _openPdfExternally(record.fileName);
                },
              )
            else
              PrimaryButton(
                buttonText: 'Export PDF',
                onPressed: () async {
                  await _exportAsPdf(record.fileName);
                },
              ),
            const SizedBox(height: 8),
            Text(
              'Processing type: ${record.scanType.displayName}',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openPdfExternally(String path) async {
    await OpenFile.open(path);
  }

  Future<void> _exportAsPdf(String imagePath) async {
    // final tempPdfPath = await PdfUtils.createTempPdfFromImage(imagePath);
    try {
      await OpenFile.open('tempPdfPath');
    } finally {
      File('tempPdfPath').delete().ignore();
    }
  }
}

class _PreviewCard extends StatelessWidget {
  const _PreviewCard({required this.record, required this.isPdf});

  final ScanRecord record;
  final bool isPdf;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: colorScheme.outline.withValues(alpha: 0.6)),
        ),
        clipBehavior: Clip.antiAlias,
        child: isPdf
            ? Center(
                child: Icon(
                  Icons.picture_as_pdf,
                  size: 64,
                  color: colorScheme.onSurfaceVariant,
                ),
              )
            : Image.file(
                File(record.fileName),
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
    );
  }
}

class _MetadataCard extends StatelessWidget {
  const _MetadataCard({required this.record});

  final ScanRecord record;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MetadataRow(label: 'Date', value: record.formattedDate),
          const SizedBox(height: 8),
          _MetadataRow(
            label: 'Processing type',
            value: record.scanType.displayName,
          ),
          const SizedBox(height: 8),
          _MetadataRow(
            label: 'File size',
            value: _formatFileSize(record.fileSizeBytes),
          ),
        ],
      ),
    );
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    final kb = bytes / 1024;
    if (kb < 1024) return '${kb.toStringAsFixed(1)} KB';
    final mb = kb / 1024;
    return '${mb.toStringAsFixed(1)} MB';
  }
}

class _MetadataRow extends StatelessWidget {
  const _MetadataRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: textTheme.bodyMedium,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('History Detail')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 64, color: colorScheme.error),
            const SizedBox(height: 16),
            Text(
              'Error',
              style: textTheme.titleLarge?.copyWith(color: colorScheme.error),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
            ),
          ],
        ),
      ),
    );
  }
}
