import 'package:flutter/material.dart';
import 'package:azure_website/core/constants/Colors.dart'; // Adjust path to your colors

class PreviousButton extends StatelessWidget {
  final VoidCallback? onPressed; // Pass null to grey-out and disable the button
  final String text;

  const PreviousButton({
    required this.onPressed,
    this.text = 'Previous',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.arrow_back_ios_new, size: 16),
      label: Text(text),
      style: OutlinedButton.styleFrom(
        foregroundColor:
            AppColors.softblack, // Your eye-friendly soft black text
        side: const BorderSide(color: AppColors.softWhite, width: 1.5),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  final VoidCallback? onPressed; // Pass null to grey-out and disable the button
  final String text;

  const NextButton({required this.onPressed, this.text = 'Next', super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.softblack, // Solid eye-friendly background
        foregroundColor: AppColors.softWhite, // Crisp white text/icon inside
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        elevation: 0, // Clean, modern flat look
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}
