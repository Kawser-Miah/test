import 'package:flutter/material.dart';

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
                gradient: isActive
                    ? const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFF45B7FF),
                    Color(0xFF8B5CF6),
                  ],
                )
                    : null,
                color: isActive
                    ? null
                    : const Color(0xFFE9EEF3),
              ),
            ),
          ),
        );
      }),
    );
  }
}

// import 'package:flutter/material.dart';
//
// import '../../../theme/app_colors.dart';
//
// class OnboardingProgress extends StatelessWidget {
//   final int currentStep;
//   final int totalSteps;
//   final double spacing;
//   final double height;
//
//   const OnboardingProgress({
//     super.key,
//     required this.currentStep,
//     required this.totalSteps,
//     this.spacing = 6,
//     this.height = 4,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: List.generate(
//         totalSteps,
//             (index) {
//           final isActive = index < currentStep;
//
//           return Expanded(
//             child: Padding(
//               padding: EdgeInsets.only(
//                 right: index == totalSteps - 1 ? 0 : spacing,
//               ),
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 curve: Curves.easeInOut,
//                 height: height,
//                 decoration: BoxDecoration(
//                   color: isActive
//                       ? AppColors.progressActive
//                       : AppColors.progressInactive,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }