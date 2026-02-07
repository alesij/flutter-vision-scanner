import 'package:flutter/material.dart';
import 'package:flutter_vision_scanner/app/features/capture/controller/choose_source_dialog_controller.dart';
import 'package:get/get.dart';

/// A dialog widget that allows the user to choose between taking a photo
/// with the camera or selecting an image from the gallery.
class ChooseSourceDialog extends GetView<ChooseSourceDialogController> {
  /// Constructor for the ChooseSourceDialog widget.
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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: colorScheme.surfaceContainerHighest,
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
              Icon(icon, color: colorScheme.onSurfaceVariant),
              const SizedBox(width: 12),
              Text(label, style: textTheme.titleMedium),
            ],
          ),
        ),
      ),
    );
  }
}
