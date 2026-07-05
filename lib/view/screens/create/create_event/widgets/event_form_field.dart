import 'package:flutter/material.dart';
import 'package:test_project/config/theme/app_colors.dart';

/// Labeled rounded gray input used throughout the Create Event form.
///
/// Set [readOnly] + [onTap] to use this as a tappable "field-styled" button
/// instead of a real text input (e.g. the Date/Time triggers).
class EventFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final IconData? leadingIcon;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputType keyboardType;
  final int maxLines;

  const EventFormField({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    this.leadingIcon,
    this.readOnly = false,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.surfaceChipInactive,
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
            prefixIcon: leadingIcon != null
                ? Icon(leadingIcon, size: 20, color: AppColors.icon)
                : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
