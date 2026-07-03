import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Background
  static const Color background = Color(0xFFF1F5F9);

  // Primary Gradient
  static const Color primaryBlue = Color(0xFF4DB6FF);
  static const Color primaryPurple = Color(0xFF8B5CF6);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      primaryBlue,
      primaryPurple,
    ],
  );

  // Text
  static const Color textPrimary = Color(0xFF222222);
  static const Color textSecondary = Color(0xFF707070);

  // Card
  static const Color card = Colors.white;

  // Border
  static const Color border = Color(0xFFE6E6E6);

  // Selected Border
  static const Color selectedBorder = Color(0xFF8B5CF6);

  // Progress
  static const Color progressInactive = Colors.white;
  static const Color progressActive = Color(0xFF8B5CF6);

  // Icon
  static const Color icon = Color(0xFF767676);

  // Checkbox
  static const Color check = Color(0xFF2F80ED);
}