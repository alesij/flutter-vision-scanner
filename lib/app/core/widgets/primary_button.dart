import 'package:flutter/material.dart';

/// A primary button widget with full width and elevated style.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.width = double.infinity,
    required this.buttonText,
    required this.onPressed,
  });

  final String buttonText;
  final double width;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(onPressed: onPressed, child: Text(buttonText)),
    );
  }
}
