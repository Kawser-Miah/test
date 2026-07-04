import 'package:flutter/material.dart';
import 'package:test_project/config/theme/app_colors.dart';
import 'package:test_project/config/theme/app_gradient.dart';
import 'get_started_screen.dart';
import 'bubble_logo.dart';

class WelcomeScreen extends StatelessWidget {
  final Animation<double> bubble1;
  final Animation<double> bubble2;
  final Animation<double> bubble3;
  final Animation<double> bubble4;

  final Animation<double> logoTextAnimation;
  final Animation<double> moveUpAnimation;
  final Animation<double> bodyAnimation;
  final Animation<double> buttonAnimation;

  const WelcomeScreen({
    super.key,
    required this.bubble1,
    required this.bubble2,
    required this.bubble3,
    required this.bubble4,
    required this.logoTextAnimation,
    required this.moveUpAnimation,
    required this.bodyAnimation,
    required this.buttonAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedBuilder(
        animation: Listenable.merge([
          bubble1,
          bubble2,
          bubble3,
          bubble4,
          logoTextAnimation,
          moveUpAnimation,
          bodyAnimation,
          buttonAnimation,
        ]),
        builder: (_, __) {
          // Logo group moves up once text/button appear
          final topOffset = Tween<double>(
            begin: 0,
            end: -80,
          ).transform(
            Curves.easeInOut.transform(moveUpAnimation.value),
          );

          return Stack(
            fit: StackFit.expand,
            children: [
              // ── Center: logo + vibe.now + subtitle ──────────────────
              Center(
                child: Transform.translate(
                  offset: Offset(0, topOffset),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Bubble logo — perfectly centered on screen
                      BubbleLogo(
                        bubble1: bubble1,
                        bubble2: bubble2,
                        bubble3: bubble3,
                        bubble4: bubble4,
                      ),

                      const SizedBox(height: 20),

                      // "vibe.now" fades + slides up
                      Opacity(
                        opacity: logoTextAnimation.value.clamp(0.0, 1.0),
                        child: Transform.translate(
                          offset: Offset(
                            0,
                            18 * (1 - logoTextAnimation.value),
                          ),
                          child: const Text(
                            'vibe.now',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textOnboardingTitle,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Subtitle fades + slides up
                      Opacity(
                        opacity: bodyAnimation.value.clamp(0.0, 1.0),
                        child: Transform.translate(
                          offset: Offset(
                            0,
                            20 * (1 - bodyAnimation.value),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 44),
                            child: Text(
                              'Real connections. Right here.\nRight now. Let\'s vibe together!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.65,
                                color: AppColors.textOnboardingSubtitle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Bottom: Next button pinned to bottom ─────────────────
              Positioned(
                left: 24,
                right: 24,
                bottom: 32,
                child: Opacity(
                  opacity: buttonAnimation.value.clamp(0.0, 1.0),
                  child: Transform.translate(
                    offset: Offset(0, 60 * (1 - buttonAnimation.value)),
                    child: SizedBox(
                      height: 56,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: AppGradients.fab,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.gradientFabPurple
                                  .withValues(alpha: 0.35),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const GetStartedScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shadowColor: AppColors.transparent,
                            backgroundColor: AppColors.transparent,
                            foregroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
