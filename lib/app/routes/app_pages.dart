import 'package:flutter_vision_scanner/app/features/home/binding/home_binding.dart';
import 'package:flutter_vision_scanner/app/features/home/presentation/home_page.dart';
import 'package:flutter_vision_scanner/app/features/processing/binding/precessing_binding.dart';
import 'package:flutter_vision_scanner/app/features/processing/presentation/processing_screen.dart';
import 'package:flutter_vision_scanner/app/features/result/binding/result_binding.dart';
import 'package:flutter_vision_scanner/app/features/result/presentation/result_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_vision_scanner/app/routes/app_routes.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.processing,
      page: () => const ProcessingScreen(),
      binding: ProcessingBinding(),
    ),
    GetPage(
      name: Routes.result,
      page: () => const ResultScreen(),
      binding: ResultBinding(),
    ),
  ];
}
