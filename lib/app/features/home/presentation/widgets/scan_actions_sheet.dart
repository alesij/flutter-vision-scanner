import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScanActionsSheet extends StatelessWidget {
  const ScanActionsSheet({
    super.key,
    required this.onDelete,
    required this.onViewDetails,
  });

  final VoidCallback onDelete;
  final VoidCallback onViewDetails;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Actions', style: textTheme.titleMedium),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('View details'),
              onTap: () {
                Get.back();
                onViewDetails();
              },
            ),
            ListTile(
              leading: Icon(Icons.delete_outline, color: colorScheme.error),
              title: Text(
                'Delete',
                style: textTheme.bodyLarge?.copyWith(color: colorScheme.error),
              ),
              onTap: () {
                Get.back();
                onDelete();
              },
            ),
          ],
        ),
      ),
    );
  }
}
