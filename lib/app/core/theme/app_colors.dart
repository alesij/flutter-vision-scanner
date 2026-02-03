import 'package:flutter/material.dart';

abstract class AppColors {
  // Background & Surface
  static const Color bg = Color.fromARGB(255, 26, 26, 36);
  static const Color surface = Color.fromARGB(255, 34, 34, 46);
  static const Color surfaceVariant = Color.fromRGBO(72, 76, 109, 0.2);

  // Primary & Secondary
  static const Color primary = Color(0xFFEC5C6D);
  static const Color secondary = Color(0xFF7C5CFF);

  // Text & Foreground
  static const Color textPrimary = Color(0xFFECECF4);
  static const Color textSecondary = Color(0xFFB8BACB);

  // Status & Semantic
  static const Color error = Color(0xFFFF453A);
  static const Color tertiary = Color(0xFF3DDCFF);

  // Neutral
  static const Color outline = Color(0xFF2A2B3F);
  static const Color scrim = Colors.black;

  // Inverse
  static const Color inverseSurface = Color(0xFFECECF4);
  static const Color inversePrimary = Color(0xFFFF8AA0);
  static const Color inverseOnSurface = Color(0xFF171827);
}
