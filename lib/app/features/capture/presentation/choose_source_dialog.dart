import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vision_scanner/app/features/capture/controller/choose_source_dialog_controller.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ChooseSourceDialog extends GetView<ChooseSourceDialogController> {
  const ChooseSourceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 28),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 22, 22, 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Source',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 18),
            _ActionTile(
              icon: Icons.photo_camera,
              label: 'Camera',
              onTap: () async {
                await controller.onCameraTap();
              },
            ),
            const SizedBox(height: 12),
            _ActionTile(
              icon: Icons.photo,
              label: 'Gallery',
              onTap: () async {
                await controller.onGalleryTap();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Material(
      color: cs.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: 64,
          width: double.infinity,
          child: Row(
            children: [
              const SizedBox(width: 16),
              Icon(icon, color: cs.onSurfaceVariant),
              const SizedBox(width: 12),
              Text(label, style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool> _ensureGalleryPermission(BuildContext context) async {
  final Permission toRequest = Platform.isIOS
      ? Permission.photos
      : Permission.storage;
  final status = await toRequest.status;
  if (status.isGranted) return true;

  final result = await toRequest.request();
  if (result.isGranted) return true;

  if (result.isPermanentlyDenied) {
    final open = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Permission required'),
        content: const Text(
          'Photo permission is permanently denied. Open settings?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Open'),
          ),
        ],
      ),
    );

    if (open == true) await openAppSettings();
  }

  return false;
}
