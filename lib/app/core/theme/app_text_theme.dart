import 'package:flutter/material.dart';
import 'package:flutter_vision_scanner/app/core/theme/app_colors.dart';

/// Defines the text styles used throughout the app,
/// ensuring a consistent typography that aligns with the overall design.
class AppTextTheme {
  /// The main text theme for the app.
  static const TextTheme theme = TextTheme(
    titleLarge: TextStyle(
      color: AppColors.textPrimary,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      color: AppColors.textPrimary,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      color: AppColors.textSecondary,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: AppColors.textSecondary,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  );
}
