import 'package:flutter/material.dart';

/// A primary button widget with full width and elevated style.
class PrimaryButton extends StatelessWidget {
  /// The text to display on the button.
  final String buttonText;

  /// The width of the button, defaulting to full width.
  final double width;

  /// The callback function to execute when the button is pressed.
  final VoidCallback? onPressed;

  /// Whether to show a loading indicator instead of the button text.
  final bool isLoading;

  /// Optional text to display when the button is in loading state.
  final String? isLoadingText;

  /// Constructor for the PrimaryButton widget.
  const PrimaryButton({
    super.key,
    this.width = double.infinity,
    required this.buttonText,
    required this.onPressed,
    this.isLoading = false,
    this.isLoadingText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: theme.primaryColor,
              blurRadius: 20,
              spreadRadius: 20,
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          child: isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(width: 8),
                    Text(isLoadingText ?? 'Loading...'),
                  ],
                )
              : Text(buttonText),
        ),
      ),
    );
  }
}
