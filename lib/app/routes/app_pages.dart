import 'package:flutter_vision_scanner/app/features/home/binding/home_binding.dart';
import 'package:flutter_vision_scanner/app/features/home/presentation/home_page.dart';
import 'package:get/get.dart';
import 'package:flutter_vision_scanner/app/routes/app_routes.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
