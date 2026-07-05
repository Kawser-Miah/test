import 'package:flutter/material.dart';
import 'package:test_project/config/theme/app_colors.dart';
import 'package:test_project/config/theme/app_gradient.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';


class CreationOptionCard extends StatelessWidget {
  final Gradient gradient;
  final IconData icon;
  final String title;
  final String description;
  final Color? borderColor;
  final VoidCallback onTap;

  const CreationOptionCard({
    super.key,
    required this.gradient,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(18),
            border: borderColor != null
                ? GradientBoxBorder(
              width: 2,
              gradient: LinearGradient(
                colors: [
                  AppColors.gradientFabPurple.withValues(alpha: 0.5),
                  AppColors.gradientFabPink.withValues(alpha: 0.5),
                  AppColors.gradientFabBlue.withValues(alpha: 0.5),
                ],
                stops: const [0.1164, 0.4874, 0.8704],
                transform: kAppGradientRotation,
              ),
            )
                : Border.all(color: AppColors.borderBlack12, width: 1),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Gradient
              Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),

                  gradient: gradient,
                ),
                alignment: Alignment.center,
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      center: const Alignment(-0.25, -0.25),
                      radius: 1.1,
                      colors: [
                        AppColors.white.withValues(alpha: 0.15),
                        AppColors.white.withValues(alpha: 0.15),
                      ],
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: .12),
                        blurRadius: 18,
                        spreadRadius: -2,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      size: 24,
                      color: AppColors.textPrimary,
                    ),
                  ),
                )
              ),

              // Bottom Content
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textBlackPrimary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 13.5,
                        color: AppColors.textBlackSecondary,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
