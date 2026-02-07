import 'package:flutter/material.dart';

/// A primary button widget with full width and elevated style.
class PrimaryButton extends StatelessWidget {
  /// The text to display on the button.
  final String buttonText;

  /// The width of the button, defaulting to full width.
  final double width;

  /// The callback function to execute when the button is pressed.
  final VoidCallback? onPressed;

  /// Constructor for the PrimaryButton widget.
  const PrimaryButton({
    super.key,
    this.width = double.infinity,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(onPressed: onPressed, child: Text(buttonText)),
    );
  }
}
