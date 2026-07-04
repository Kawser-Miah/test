import 'package:flutter/material.dart';
import 'package:test_project/config/theme/app_colors.dart';

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final double radius;

  DashedBorderPainter({
    this.color= AppColors.borderDashed,
    this.strokeWidth= 1,
    this.dashWidth= 5,
    this.dashSpace= 5,
    this.radius= 24,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(radius),
    );

    final path = Path()..addRRect(rect);

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    for (final metric in path.computeMetrics()) {
      double distance = 0;

      while (distance < metric.length) {
        final next = distance + dashWidth;

        canvas.drawPath(
          metric.extractPath(
            distance,
            next.clamp(0, metric.length),
          ),
          paint,
        );

        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant DashedBorderPainter oldDelegate) {
    return color != oldDelegate.color ||
        strokeWidth != oldDelegate.strokeWidth ||
        dashWidth != oldDelegate.dashWidth ||
        dashSpace != oldDelegate.dashSpace ||
        radius != oldDelegate.radius;
  }
}