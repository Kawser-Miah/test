import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Rotation shared by every gradient in the app (75°).
///
/// Keeping this in one place means every screen tilts its gradients the
/// same way instead of each widget picking its own begin/end alignment.
const GradientRotation kAppGradientRotation = GradientRotation(
  75 * math.pi / 180,
);

/// Named gradients for the app, built from [AppColors] and sharing
/// [kAppGradientRotation]. Reference these instead of constructing a
/// [LinearGradient] inline in a page/widget.
class AppGradients {
  AppGradients._();

  /// Onboarding progress bar active-step gradient.
  static const LinearGradient progress = LinearGradient(
    colors: [AppColors.gradientProgressStart, AppColors.primaryPurple],
    transform: kAppGradientRotation,
  );

  /// The app's single button gradient (bottom-nav FAB, and every other
  /// gradient-filled button/pill in the app).
  static const LinearGradient fab =  LinearGradient(
    begin: Alignment(0.65, -1.0),   // roughly matches 232.79deg
    end: Alignment(-0.65, 1.0),
    colors: [
      Color(0xFF57C2FF), // top-right: light blue
      Color(0xFFC470F5), // middle: purple/pink
      Color(0xFF8663F6), // bottom-left: violet
    ],
    stops: [0.0, 0.55, 1.0], // approximates 11.64% / 48.74% / 87.04%
  );

  /// Create-selection screen background gradient.
  static const LinearGradient createBackground = LinearGradient(
    colors: [AppColors.backgroundGradientStart, AppColors.backgroundGradientEnd],
    transform: kAppGradientRotation,
  );

  /// Event card gradient (primary).
  static const LinearGradient event = LinearGradient(
    colors: [AppColors.gradientEventPink, AppColors.gradientEventPurple],
    transform: kAppGradientRotation,
  );

  /// Event card gradient (light variant, e.g. icon badges).
  static const LinearGradient eventLight = LinearGradient(
    colors: [
      AppColors.gradientEventLightPink,
      AppColors.gradientEventLightPurple,
    ],
    transform: kAppGradientRotation,
  );

  /// Community card gradient.
  static const LinearGradient community = LinearGradient(
    colors: [AppColors.gradientCommunityCyan, AppColors.gradientCommunityBlue],
    transform: kAppGradientRotation,
  );

  /// Soft form-card background (header banner, upload-image box).
  static const LinearGradient formCard = LinearGradient(
    colors: [AppColors.surfaceIconCircle, AppColors.white],
    transform: kAppGradientRotation,
  );
}

/// Common widget for painting a gradient background/badge/button.
///
/// Every page should use this instead of hand-writing
/// `Container(decoration: BoxDecoration(gradient: ...))` so the app's
/// gradients stay visually consistent (see [kAppGradientRotation]).
class GradientBox extends StatelessWidget {
  final Gradient gradient;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final BoxShape shape;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final double? width;
  final double? height;

  const GradientBox({
    super.key,
    required this.gradient,
    this.child,
    this.borderRadius,
    this.shape = BoxShape.rectangle,
    this.border,
    this.boxShadow,
    this.padding,
    this.alignment,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      alignment: alignment,
      decoration: BoxDecoration(
        gradient: gradient,
        shape: shape,
        borderRadius: shape == BoxShape.circle ? null : borderRadius,
        border: border,
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
