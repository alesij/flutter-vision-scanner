import 'package:flutter/material.dart';
import 'package:flutter_vision_scanner/app/core/theme/app_theme_data.dart';
import 'package:flutter_vision_scanner/app/routes/app_pages.dart';
import 'package:flutter_vision_scanner/app/routes/app_routes.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

/// The main application widget that sets up the GetMaterialApp
/// with routes and theme.
class App extends StatelessWidget {
  /// Constructor for the App widget.
  const App({super.key});

  @override
  Widget build(context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.theme,
      themeMode: ThemeMode.dark,
      initialRoute: Routes.home,
      getPages: AppPages.pages,
    );
  }
}
