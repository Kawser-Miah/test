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

  static const LinearGradient primary = LinearGradient(
    colors: [AppColors.primaryBlue, AppColors.primaryPurple],
    transform: kAppGradientRotation,
  );

  /// Onboarding final screen "Get Started" button gradient.
  static const LinearGradient finalButton = LinearGradient(
    colors: [AppColors.gradientFinalBlue, AppColors.gradientFinalPurple],
    transform: kAppGradientRotation,
  );

  /// Onboarding "Next" button gradient.
  static const LinearGradient onboardingNext = LinearGradient(
    colors: [AppColors.gradientButtonCyan, AppColors.gradientButtonPurple],
    transform: kAppGradientRotation,
  );

  /// Onboarding progress bar active-step gradient.
  static const LinearGradient progress = LinearGradient(
    colors: [AppColors.gradientProgressStart, AppColors.primaryPurple],
    transform: kAppGradientRotation,
  );

  /// Notification "Allow" button gradient.
  static const LinearGradient allow = LinearGradient(
    colors: [
      AppColors.gradientAllowCyan,
      AppColors.gradientAllowPink,
      AppColors.gradientAllowPurple,
    ],
    transform: kAppGradientRotation,
  );

  /// Bottom-nav FAB / "add" gradient.
  static const LinearGradient fab = LinearGradient(
    colors: [
      AppColors.gradientFabPurple,
      AppColors.gradientFabPink,
      AppColors.gradientFabBlue,
    ],
    stops: [0.1164, 0.4874, 0.8704],
    transform: kAppGradientRotation,
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

  /// Splash/intro background gradient.
  static const LinearGradient intro = LinearGradient(
    colors: [AppColors.gradientIntroCyan, AppColors.gradientIntroPeriwinkle],
    transform: kAppGradientRotation,
  );

  /// Event card accent border/badge gradient (blue → purple → pink).
  static const LinearGradient eventCardAccent = LinearGradient(
    colors: [
      AppColors.gradientFabBlue,
      AppColors.gradientFabPurple,
      AppColors.gradientFabPink,
    ],
    stops: [0.1164, 0.4874, 0.8704],
    transform: kAppGradientRotation,
  );

  /// Create-post screen "add" button gradient.
  static const LinearGradient addButton = LinearGradient(
    colors: [AppColors.gradientAddButtonBlue, AppColors.gradientAddButtonPurple],
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
