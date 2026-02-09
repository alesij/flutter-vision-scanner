import 'package:flutter_vision_scanner/app/features/home/binding/home_binding.dart';
import 'package:flutter_vision_scanner/app/features/home/presentation/home_page.dart';
import 'package:flutter_vision_scanner/app/features/processing/binding/precessing_binding.dart';
import 'package:flutter_vision_scanner/app/features/processing/presentation/processing_screen.dart';
import 'package:flutter_vision_scanner/app/features/scan_detail/binding/scan_detail_binding.dart';
import 'package:flutter_vision_scanner/app/features/scan_detail/presentation/scan_detail_screen.dart';
import 'package:flutter_vision_scanner/app/features/scan_result/binding/scan_result_binding.dart';
import 'package:flutter_vision_scanner/app/features/scan_result/presentation/scan_result_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_vision_scanner/app/routes/app_routes.dart';

/// Defines the application pages and their associated routes and bindings.
class AppPages {
  /// List of application pages with their routes and bindings.
  static final pages = <GetPage>[
    /// Home page.
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),

    /// Processing page.
    GetPage(
      name: Routes.processing,
      page: () => const ProcessingScreen(),
      binding: ProcessingBinding(),
    ),

    /// Result page.
    GetPage(
      name: Routes.result,
      page: () => const ScanResultScreen(),
      binding: ScanResultBinding(),
    ),

    /// Scan detail page.
    GetPage(
      name: Routes.scanDetail,
      page: () => const ScanDetailScreen(),
      binding: ScanDetailBinding(),
    ),
  ];
}
