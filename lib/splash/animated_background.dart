import 'package:flutter/material.dart';

class AnimatedBackground extends StatelessWidget {
  /// Controls the fade FROM cyan-blue intro TO white (0.0 → 1.0)
  final Animation<double> introAnimation;

  /// Controls the fade FROM white TO light-blue final (0.0 → 1.0)
  final Animation<double> finalAnimation;

  const AnimatedBackground({
    super.key,
    required this.introAnimation,
    required this.finalAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([introAnimation, finalAnimation]),
      builder: (_, __) {
        // ── Phase 1 → Phase 2: cyan-blue gradient fades to white ──────
        final topColor = Color.lerp(
          const Color(0xFF5ECFFF), // cyan-blue top (Mobile.png)
          Colors.white,
          introAnimation.value,
        )!;

        final bottomColor = Color.lerp(
          const Color(0xFF6B7FFF), // periwinkle-blue bottom (Mobile.png)
          Colors.white,
          introAnimation.value,
        )!;

        // ── Phase 2 → Phase 3: white fades to light-blue (Mobile-5) ──
        final finalTopLeft = Color.lerp(
          Colors.white,
          const Color(0xFFD0EBFF),
          finalAnimation.value,
        )!;

        final finalTopRight = Color.lerp(
          Colors.white,
          const Color(0xFFE8F4FF),
          finalAnimation.value,
        )!;

        // Blend the two phases together:
        // When introAnimation < 1, we show the cyan→white transition.
        // When introAnimation = 1, finalAnimation takes over.
        final resolvedTop = Color.lerp(topColor, finalTopLeft, finalAnimation.value)!;
        final resolvedMid = Color.lerp(topColor, finalTopRight, finalAnimation.value)!;
        final resolvedBottom = Color.lerp(bottomColor, Colors.white, finalAnimation.value)!;

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                resolvedTop,
                resolvedMid,
                resolvedBottom,
              ],
              stops: const [0.0, 0.45, 1.0],
            ),
          ),
        );
      },
    );
  }
}
