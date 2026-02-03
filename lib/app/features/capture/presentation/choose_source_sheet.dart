import 'package:flutter/material.dart';

class ChooseSourceDialog extends StatelessWidget {
  final VoidCallback onCamera;
  final VoidCallback onGallery;

  const ChooseSourceDialog({
    super.key,
    required this.onCamera,
    required this.onGallery,
  });

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
              onTap: onCamera,
            ),
            const SizedBox(height: 12),
            _ActionTile(icon: Icons.photo, label: 'Gallery', onTap: onGallery),
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
