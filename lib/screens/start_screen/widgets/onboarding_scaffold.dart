import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import 'gradient_button.dart';
import 'onboarding_progress.dart';

class OnboardingScaffold extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  final String title;
  final String subtitle;

  final Widget child;

  final String buttonText;
  final VoidCallback onButtonPressed;

  final bool showBackButton;
  final bool buttonEnabled;

  /// Optional widget rendered between the title and subtitle
  final Widget? headerChild;

  const OnboardingScaffold({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.title,
    required this.subtitle,
    required this.child,
    required this.buttonText,
    required this.onButtonPressed,
    this.showBackButton = true,
    this.buttonEnabled = true,
    this.headerChild,
  });

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: Column(
          children: [
            /// Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (showBackButton)
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 22,
                        ),
                      ),

                    const SizedBox(height: 24),

                    OnboardingProgress(
                      currentStep: currentStep,
                      totalSteps: totalSteps,
                    ),

                    const SizedBox(height: 32),

                    Center(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),

                    if (headerChild != null) ...[
                      const SizedBox(height: 32),
                      Center(child: headerChild!),
                    ],

                    const SizedBox(height: 10),

                    Center(
                      child: Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const SizedBox(height: 32),

                    child,
                  ],
                ),
              ),
            ),

            /// Bottom Button
            AnimatedPadding(
              duration: const Duration(milliseconds: 250),
              padding: EdgeInsets.only(
                bottom: keyboardHeight,
              ),
              child: GradientButton(
                title: buttonText,
                enabled: buttonEnabled,
                onPressed: onButtonPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}