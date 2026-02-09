import 'package:flutter/material.dart';
import 'package:flutter_vision_scanner/app/features/capture/presentation/choose_source_dialog.dart';
import 'package:flutter_vision_scanner/app/features/home/presentation/widgets/scan_actions_sheet.dart';
import 'package:flutter_vision_scanner/app/features/home/presentation/widgets/scan_list_item.dart';
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
      body: Obx(() {
        return controller.state.value.map(
          noScans: (value) => Center(
            child: Text(
              'No scans yet. Tap the + button to start scanning.',
              style: textTheme.bodyMedium,
            ),
          ),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          data: (data) => SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Text(
                    'Scanned images',
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    itemCount: data.items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (_, i) {
                      final record = data.items[i];
                      return ScanListItem(
                        record: record,
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            showDragHandle: true,
                            backgroundColor: colorScheme.surface,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(24),
                              ),
                            ),
                            builder: (_) {
                              return ScanActionsSheet(
                                onViewDetails: () {
                                  controller.navigateToScanDetails(
                                    record: record,
                                  );
                                },
                                onDelete: () {
                                  controller.deleteScanRecord(record: record);
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () => showDialog(
          barrierColor: Colors.transparent,
          context: context,

          builder: (_) => const ChooseSourceDialog(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
