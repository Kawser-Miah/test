import 'package:flutter/material.dart';
import 'package:test_project/config/theme/app_colors.dart';

class UploadPlaceholderIcon extends StatelessWidget {
  const UploadPlaceholderIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38,
      height: 38,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// Picture Frame
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.iconPlaceholderFrame,
                  width: 1.6,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: CustomPaint(
                painter: _PicturePainter(),
              ),
            ),
          ),

          /// Plus Badge
          Positioned(
            right: -3,
            bottom: -3,
            child: Container(
              width: 18,
              height: 18,
              decoration: const BoxDecoration(
                color: AppColors.primaryPurple,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                size: 12,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PicturePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.iconPlaceholderFrame
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    // Mountain
    final mountain = Path()
      ..moveTo(size.width * .18, size.height * .70)
      ..lineTo(size.width * .42, size.height * .46)
      ..lineTo(size.width * .58, size.height * .60)
      ..lineTo(size.width * .82, size.height * .34);

    canvas.drawPath(mountain, paint);

    // Sun
    canvas.drawCircle(
      Offset(size.width * .72, size.height * .28),
      2.6,
      Paint()..color = AppColors.iconPlaceholderFrame,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}