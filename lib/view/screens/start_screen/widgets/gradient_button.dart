import 'package:flutter/material.dart';

import '../../../../config/theme/app_colors.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool enabled;
  final double height;
  final EdgeInsetsGeometry? margin;

  const GradientButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.enabled = true,
    this.height = 56,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ??
          const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: true
                ? AppColors.primaryGradient
                : const LinearGradient(
              colors: [
                Colors.grey,
                Colors.grey,
              ],
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: ElevatedButton(
            onPressed: enabled ? onPressed : null,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.transparent,
              disabledBackgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}