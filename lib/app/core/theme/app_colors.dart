import 'package:flutter/material.dart';

/// Application color palette following Material 3 dark theme design system.
///
/// This class contains all color constants used throughout the app,
/// organized by semantic purpose (background, text, status, etc.).
/// All colors are designed for a dark theme with proper contrast ratios
/// for accessibility.
abstract class AppColors {
  // ============== Background & Surface ==============
  /// Primary background color for the entire application.
  /// Used as the base surface for most screens.
  static const Color bg = Color.fromARGB(255, 26, 26, 36);

  /// Main surface color for cards, containers, and elevated elements.
  /// Slightly lighter than [bg] to create visual hierarchy.
  static const Color surface = Color.fromARGB(255, 34, 34, 46);

  /// Variant surface color with transparency for subtle overlays and dividers.
  /// Used to create secondary surface areas without strong contrast.
  static const Color surfaceVariant = Color.fromRGBO(72, 76, 109, 0.2);

  // ============== Primary & Secondary ==============
  /// Primary brand color used for CTAs, highlights, and key interactive elements.
  /// Vibrant pink/red for high visibility and engagement.
  static const Color primary = Color(0xFFEC5C6D);

  /// Secondary accent color for alternative actions and secondary CTAs.
  /// Complementary purple that works well with primary color.
  static const Color secondary = Color(0xFF7C5CFF);

  // ============== Text & Foreground ==============
  /// Primary text color for main content and headings.
  /// High contrast light gray for optimal readability on dark background.
  static const Color textPrimary = Color(0xFFECECF4);

  /// Secondary text color for captions, hints, and disabled states.
  /// Lower contrast for visual hierarchy and subtlety.
  static const Color textSecondary = Color(0xFFB8BACB);

  // ============== Status & Semantic ==============
  /// Error state color for validation messages, warnings, and error indicators.
  /// Bright red for clear visibility of problematic states.
  static const Color error = Color(0xFFFF453A);

  /// Tertiary color for additional accent purposes.
  /// Bright cyan for secondary highlighting and info indicators.
  static const Color tertiary = Color(0xFF3DDCFF);

  // ============== Neutral ==============
  /// Outline and border color for dividers and subtle separators.
  /// Very dark purple-gray for minimal visual separation.
  static const Color outline = Color(0xFF2A2B3F);

  /// Scrim color for overlays and modal backgrounds.
  /// Pure black used to darken background when modals are shown.
  static const Color scrim = Colors.black;

  // ============== Inverse & Semantic Contrast ==============
  /// Inverse surface color for high-contrast elements.
  /// Light color used when placed on dark backgrounds for maximum contrast.
  static const Color inverseSurface = Color(0xFFECECF4);

  /// Inverse primary color for elements on inverted backgrounds.
  /// Light pink used when primary color needs contrast inversion.
  static const Color inversePrimary = Color(0xFFFF8AA0);

  /// Inverse text color for text on inverted backgrounds.
  /// Very dark gray-blue for high contrast on light surfaces.
  static const Color inverseOnSurface = Color(0xFF171827);
}
