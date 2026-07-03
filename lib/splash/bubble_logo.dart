import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BubbleLogo extends StatelessWidget {
  final Animation<double> bubble1;
  final Animation<double> bubble2;
  final Animation<double> bubble3;
  final Animation<double> bubble4;

  const BubbleLogo({
    super.key,
    required this.bubble1,
    required this.bubble2,
    required this.bubble3,
    required this.bubble4,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 130,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // Bottom Bubble (drops last)
          _Bubble(
            animation: bubble4,
            asset: 'assets/logo/bubble_bottom.svg',
            dx: 0,
            dy: 46,
          ),

          // Left Bubble
          _Bubble(
            animation: bubble2,
            asset: 'assets/logo/bubble_left.svg',
            dx: -22,
            dy: 18,
          ),

          // Right Bubble
          _Bubble(
            animation: bubble3,
            asset: 'assets/logo/bubble_right.svg',
            dx: 22,
            dy: 18,
          ),

          // Top Bubble (drops first)
          _Bubble(
            animation: bubble1,
            asset: 'assets/logo/bubble_top.svg',
            dx: 0,
            dy: -16,
          ),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  final Animation<double> animation;
  final String asset;
  final double dx;
  final double dy;

  const _Bubble({
    required this.animation,
    required this.asset,
    required this.dx,
    required this.dy,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        final t = animation.value;

        final drop = Tween<double>(
          begin: -320,
          end: 0,
        ).transform(
          Curves.easeOutCubic.transform(t),
        );
        // Drop animation
        // final drop = TweenSequence<double>([
        //   TweenSequenceItem(
        //     tween: Tween(begin: -320.0, end: 20.0),
        //     weight: 75,
        //   ),
        //   TweenSequenceItem(
        //     tween: Tween(begin: 20.0, end: -10.0),
        //     weight: 15,
        //   ),
        //   TweenSequenceItem(
        //     tween: Tween(begin: -10.0, end: 0.0),
        //     weight: 10,
        //   ),
        // ]).transform(Curves.easeOut.transform(t));

        // Pop animation
        final scale = TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween(begin: .15, end: 1.18),
            weight: 70,
          ),
          TweenSequenceItem(
            tween: Tween(begin: 1.18, end: .95),
            weight: 15,
          ),
          TweenSequenceItem(
            tween: Tween(begin: .95, end: 1.0),
            weight: 15,
          ),
        ]).transform(t);

        // Small rotation while falling
        final rotation = Tween<double>(
          begin: -.30,
          end: 0,
        ).transform(Curves.easeOut.transform(t));

        // Fade in
        final opacity =
        Curves.easeIn.transform((t / .7).clamp(0.0, 1.0));

        return Transform.translate(
          offset: Offset(dx, dy + drop),
          child: Transform.rotate(
            angle: rotation,
            child: Transform.scale(
              scale: scale,
              child: Opacity(
                opacity: opacity,
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: SvgPicture.asset(
                    asset,
                    fit: BoxFit.contain,
                  ),
                )
              ),
            ),
          ),
        );
      },
    );
  }
}



// import 'package:flutter/material.dart';
//
// /// Logo made of 4 semi-transparent circles that drop in one by one.
// ///
// /// Drop order (matches animation spec):
// ///   bubble1 → purple  (top-center)
// ///   bubble2 → blue    (bottom-left)
// ///   bubble3 → pink    (bottom-right)
// ///   bubble4 → purple  (bottom-center, slightly lower — completes the clover)
// class BubbleLogo extends StatelessWidget {
//   final Animation<double> bubble1;
//   final Animation<double> bubble2;
//   final Animation<double> bubble3;
//   final Animation<double> bubble4;
//
//   const BubbleLogo({
//     super.key,
//     required this.bubble1,
//     required this.bubble2,
//     required this.bubble3,
//     required this.bubble4,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 120,
//       height: 120,
//       child: Stack(
//         alignment: Alignment.center,
//         clipBehavior: Clip.none,
//         children: [
//           // bubble4 — BEHIND everything (first in Stack = bottom layer)
//           _Bubble(
//             animation: bubble4,
//             color: const Color(0xFF9B6BFF),
//             dx: 0,
//             dy: 26,
//           ),
//           // bubble2 — blue bottom-left
//           _Bubble(
//             animation: bubble2,
//             color: const Color(0xFF53B8FF),
//             dx: -22,
//             dy: 18,
//           ),
//           // bubble3 — pink bottom-right
//           _Bubble(
//             animation: bubble3,
//             color: const Color(0xFFE060C0),
//             dx: 22,
//             dy: 18,
//           ),
//           // bubble1 — purple top (last in Stack = front layer)
//           _Bubble(
//             animation: bubble1,
//             color: const Color(0xFF7C3AED),
//             dx: 0,
//             dy: -16,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _Bubble extends StatelessWidget {
//   final Animation<double> animation;
//   final Color color;
//   final double dx;
//   final double dy;
//
//   const _Bubble({
//     required this.animation,
//     required this.color,
//     required this.dx,
//     required this.dy,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: animation,
//       builder: (_, __) {
//         final t = animation.value;
//
//         // All bubbles drop from above with bounce settle
//         final drop = TweenSequence<double>([
//           TweenSequenceItem(
//             tween: Tween(begin: -280.0, end: 12.0),
//             weight: 75,
//           ),
//           TweenSequenceItem(
//             tween: Tween(begin: 12.0, end: -8.0),
//             weight: 13,
//           ),
//           TweenSequenceItem(
//             tween: Tween(begin: -8.0, end: 0.0),
//             weight: 12,
//           ),
//         ]).transform(t);
//
//         // Scale: starts small, overshoots slightly, settles
//         final scale = TweenSequence<double>([
//           TweenSequenceItem(
//             tween: Tween(begin: 0.2, end: 1.12),
//             weight: 70,
//           ),
//           TweenSequenceItem(
//             tween: Tween(begin: 1.12, end: 0.96),
//             weight: 15,
//           ),
//           TweenSequenceItem(
//             tween: Tween(begin: 0.96, end: 1.0),
//             weight: 15,
//           ),
//         ]).transform(t);
//
//         // Slight rotation while falling — clockwise tilt
//         final rotation = Tween<double>(begin: -0.3, end: 0.0).transform(t);
//
//         // Fade in during first 70% of the animation
//         final opacity =
//             Curves.easeIn.transform(t.clamp(0.0, 0.7) / 0.7).clamp(0.0, 1.0);
//
//         return Transform.translate(
//           offset: Offset(dx, dy + drop),
//           child: Transform.rotate(
//             angle: rotation,
//             child: Transform.scale(
//               scale: scale,
//               child: Opacity(
//                 opacity: opacity,
//                 child: Container(
//                   width: 56,
//                   height: 56,
//                   decoration: BoxDecoration(
//                     color: color.withValues(alpha: 0.72),
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
