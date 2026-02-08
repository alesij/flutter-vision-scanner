import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vision_scanner/app/core/widgets/primary_button.dart';
import 'package:get/get.dart';

import 'package:flutter_vision_scanner/app/features/processing/controller/processing_controller.dart';
import 'package:flutter_vision_scanner/app/features/processing/state/processing_state.dart';

/// Screen for displaying image processing results using ML Kit analysis.
class ProcessingScreen extends GetView<ProcessingController> {
  /// Constructor for ProcessingScreen.
  const ProcessingScreen({super.key});

  static const double _progressHeight = 4;
  static const double _contentHeight = 140;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(
                    File(controller.imagePath ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Obx #1: progress.
              SizedBox(
                height: _progressHeight,
                child: Obx(() {
                  final show = controller.state.value.maybeWhen(
                    processing: (_) => true,
                    orElse: () => false,
                  );

                  return Visibility.maintain(
                    visible: show,
                    child: const LinearProgressIndicator(),
                  );
                }),
              ),

              const SizedBox(height: 24),

              // Obx #2: content (no jump: const slot height)
              SizedBox(
                height: _contentHeight,
                child: Obx(() {
                  final state = controller.state.value;

                  return state.when(
                    processing: (message) => Text(
                      message,
                      style: textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    successful: (_, recognizedText) => Text(
                      recognizedText?.text ?? '',
                      style: textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                    error: (message) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          message,
                          style: textTheme.titleMedium?.copyWith(
                            color: colorScheme.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        PrimaryButton(
                          buttonText: 'Go Back',
                          width: 150,
                          onPressed: controller.goBack,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
