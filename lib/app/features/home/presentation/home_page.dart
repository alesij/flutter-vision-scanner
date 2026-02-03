import 'package:flutter/material.dart';
import 'package:flutter_vision_scanner/app/features/capture/presentation/choose_source_sheet.dart';
import 'package:get/get.dart';
import 'package:flutter_vision_scanner/app/features/home/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('ImageFlow')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          barrierColor: Colors.transparent,
          context: context,

          builder: (_) => ChooseSourceDialog(
            onCamera: () {
              Navigator.pop(context); /* TODO: start camera flow */
            },
            onGallery: () {
              Navigator.pop(context); /* TODO: pick from gallery */
            },
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.recentScans.isEmpty) {
          return Center(
            child: Text('No scans yet', style: textTheme.bodyMedium),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: controller.recentScans.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (_, i) {
            final item = controller.recentScans[i];
            return Container(
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: colorScheme.outline.withValues(alpha: .6),
                ),
              ),
              child: ListTile(
                title: Text(item, style: textTheme.titleMedium),
                subtitle: Text('Jan 14, 2026', style: textTheme.bodySmall),
              ),
            );
          },
        );
      }),
    );
  }
}
