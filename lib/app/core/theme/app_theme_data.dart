import 'package:flutter/material.dart';
import 'package:flutter_vision_scanner/app/core/theme/app_colors.dart';
import 'package:flutter_vision_scanner/app/core/theme/app_text_theme.dart';

/// Defines the overall theme data for the app, including color scheme,
/// text styles, and component themes.
class AppThemeData {
  /// The main theme data for the app, configured with
  /// Material 3 design principles,
  /// a custom color scheme, and text theme.
  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    colorScheme: _colorScheme,
    textTheme: AppTextTheme.theme,
    scaffoldBackgroundColor: AppColors.bg,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.bg,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    ),
    dialogTheme: const DialogThemeData(
      backgroundColor: AppColors.surface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primary,
      linearTrackColor: AppColors.surfaceVariant,
      linearMinHeight: 4,
    ),
  );

  static const ColorScheme _colorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: Colors.white,
    secondary: AppColors.secondary,
    onSecondary: Colors.white,
    surface: AppColors.surface,
    onSurface: AppColors.textPrimary,
    surfaceContainerHighest: AppColors.surfaceVariant,
    onSurfaceVariant: AppColors.textSecondary,
    error: AppColors.error,
    onError: Colors.black,
    outline: AppColors.inverseSurface,
    shadow: Colors.black,
    scrim: AppColors.scrim,
    inverseSurface: AppColors.inverseSurface,
    onInverseSurface: AppColors.inverseOnSurface,
    inversePrimary: AppColors.inversePrimary,
    tertiary: AppColors.tertiary,
    onTertiary: Colors.black,
  );
}
