import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_vision_scanner/app/features/result/controller/result_controller.dart';

class ResultScreen extends GetView<ResultController> {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Result')),
      body: Container(),
    );
  }
}
