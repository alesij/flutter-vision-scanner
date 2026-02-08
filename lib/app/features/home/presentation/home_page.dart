import 'package:flutter/material.dart';
import 'package:flutter_vision_scanner/app/features/capture/presentation/choose_source_dialog.dart';
import 'package:flutter_vision_scanner/app/features/home/state/home_page_state.dart';
import 'package:get/get.dart';
import 'package:flutter_vision_scanner/app/features/home/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () => showDialog(
          barrierColor: Colors.transparent,
          context: context,

          builder: (_) => const ChooseSourceDialog(),
        ),
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        return controller.state.value.map(
          initial: (_) => const SizedBox.shrink(),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          data: (data) => ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: data.items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (_, i) {
              final item = data.items[i];
              return Container(
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: colorScheme.outline.withValues(alpha: .6),
                  ),
                ),
                child: ListTile(
                  title: Text(
                    data.items[i].fileName,
                    style: textTheme.titleMedium,
                  ),
                  subtitle: Text('Jan 14, 2026', style: textTheme.bodySmall),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
