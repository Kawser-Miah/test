import 'package:flutter/material.dart';
import 'package:test_project/config/theme/app_colors.dart';
import 'package:test_project/config/theme/app_gradient.dart';

class OnboardingProgress extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final double height;
  final double spacing;

  const OnboardingProgress({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.height = 4,
    this.spacing = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSteps, (index) {
        final isActive = index < currentStep;

        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: index == totalSteps - 1 ? 0 : spacing,
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: isActive ? AppGradients.progress : null,
                color: isActive ? null : AppColors.surfaceProgressInactive,
              ),
            ),
          ),
        );
      }),
    );
  }
}