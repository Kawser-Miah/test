import 'package:flutter/material.dart';

class LocationIcon extends StatelessWidget {
  const LocationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 125,
      child: CustomPaint(
        painter: _LocationPinPainter(),
      ),
    );
  }
}

class _LocationPinPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xff6E6E6E)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Scale to fit the 100x100 SVG viewBox within the widget size
    final scale = size.width / 100;
    canvas.save();
    canvas.translate(
      (size.width - 100 * scale) / 2,
      (size.height - 100 * scale) / 2,
    );
    canvas.scale(scale);

    // Main pin body outline (SVG Path 2)
    final bodyPath = Path()
      ..moveTo(55.2393, 72.89)
      ..cubicTo(53.8339, 74.2433, 51.9556, 75, 50.001, 75)
      ..cubicTo(48.046, 75, 46.1677, 74.2433, 44.7622, 72.89)
      ..cubicTo(31.8931, 60.42, 14.6468, 46.4896, 23.0573, 26.2656)
      ..cubicTo(27.6047, 15.3305, 38.5207, 8.33334, 50.001, 8.33334)
      ..cubicTo(61.481, 8.33334, 72.3968, 15.3306, 76.9443, 26.2656)
      ..cubicTo(85.3443, 46.4642, 68.1402, 60.4629, 55.2393, 72.89)
      ..close();
    canvas.drawPath(bodyPath, paint);

    // Inner circle outline (SVG Path 1)
    canvas.drawCircle(
      const Offset(50, 37.5),
      10.4168,
      paint,
    );

    // Bottom shadow arc (SVG Path 3)
    final arcPath = Path()
      ..moveTo(75, 83.3333)
      ..cubicTo(75, 87.9358, 63.8071, 91.6667, 50, 91.6667)
      ..cubicTo(36.1929, 91.6667, 25, 87.9358, 25, 83.3333);
    canvas.drawPath(arcPath, paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
