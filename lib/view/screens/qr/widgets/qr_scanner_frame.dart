import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:test_project/config/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Square camera-preview placeholder matching the "Scan Their QR Code"
/// viewfinder: a full thin rounded-rect outline with bold rounded-corner
/// accents overlaid on top.
class QrScannerFrame extends StatelessWidget {
  const QrScannerFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceIconCircle,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primaryBlue,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
            Center(
              child: SvgPicture.asset(
                'assets/logo/camera.svg',
                width: 80,
                height: 80,
              ),
            ),
            Positioned.fill(
              child: CustomPaint(painter: _ScannerFramePainter()),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScannerFramePainter extends CustomPainter {
  static const double _inset = 32;
  static const double _radius = 18;
  static const double _armLength = 15;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(
      _inset,
      _inset,
      size.width - _inset,
      size.height - _inset,
    );

    // Bold rounded-corner accents overlaid at each corner.
    final accentPaint = Paint()
      ..color = AppColors.primaryBlue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    void drawCorner(Offset arcCenter, double startAngle) {
      canvas.drawArc(
        Rect.fromCircle(center: arcCenter, radius: _radius),
        startAngle,
        math.pi / 2,
        false,
        accentPaint,
      );
    }

    // Top-left
    drawCorner(Offset(rect.left + _radius, rect.top + _radius), math.pi);
    canvas.drawLine(
      Offset(rect.left + _radius, rect.top),
      Offset(rect.left + _radius + _armLength, rect.top),
      accentPaint,
    );
    canvas.drawLine(
      Offset(rect.left, rect.top + _radius),
      Offset(rect.left, rect.top + _radius + _armLength),
      accentPaint,
    );

    // Top-right
    drawCorner(Offset(rect.right - _radius, rect.top + _radius), math.pi * 1.5);
    canvas.drawLine(
      Offset(rect.right - _radius - _armLength, rect.top),
      Offset(rect.right - _radius, rect.top),
      accentPaint,
    );
    canvas.drawLine(
      Offset(rect.right, rect.top + _radius),
      Offset(rect.right, rect.top + _radius + _armLength),
      accentPaint,
    );

    // Bottom-left
    drawCorner(Offset(rect.left + _radius, rect.bottom - _radius), math.pi / 2);
    canvas.drawLine(
      Offset(rect.left + _radius, rect.bottom),
      Offset(rect.left + _radius + _armLength, rect.bottom),
      accentPaint,
    );
    canvas.drawLine(
      Offset(rect.left, rect.bottom - _radius - _armLength),
      Offset(rect.left, rect.bottom - _radius),
      accentPaint,
    );

    // Bottom-right
    drawCorner(Offset(rect.right - _radius, rect.bottom - _radius), 0);
    canvas.drawLine(
      Offset(rect.right - _radius - _armLength, rect.bottom),
      Offset(rect.right - _radius, rect.bottom),
      accentPaint,
    );
    canvas.drawLine(
      Offset(rect.right, rect.bottom - _radius - _armLength),
      Offset(rect.right, rect.bottom - _radius),
      accentPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _ScannerFramePainter oldDelegate) => false;
}
