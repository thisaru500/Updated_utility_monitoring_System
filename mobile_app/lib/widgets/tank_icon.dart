import 'package:flutter/material.dart';

/// A small, eye-catching tank icon widget for the Smart Utility Monitoring System
class TankIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const TankIcon({
    super.key,
    this.size = 32.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final tankColor = color ?? Theme.of(context).colorScheme.primary;
    
    return CustomPaint(
      size: Size(size, size * 1.2),
      painter: _TankPainter(color: tankColor),
    );
  }
}

class _TankPainter extends CustomPainter {
  final Color color;

  _TankPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = color.withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // Tank body (rounded rectangle)
    final tankRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width * 0.1, size.height * 0.15, size.width * 0.8, size.height * 0.7),
      const Radius.circular(4),
    );
    canvas.drawRRect(tankRect, paint);

    // Tank top (rounded cap)
    final topRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width * 0.15, size.height * 0.05, size.width * 0.7, size.height * 0.15),
      const Radius.circular(3),
    );
    canvas.drawRRect(topRect, paint);

    // Water level indicator (blue gradient effect)
    final waterLevel = size.height * 0.5;
    final waterPaint = Paint()
      ..color = Colors.blue.withOpacity(0.6)
      ..style = PaintingStyle.fill;
    
    final waterRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        size.width * 0.1,
        size.height * 0.15 + (size.height * 0.7 - waterLevel),
        size.width * 0.8,
        waterLevel,
      ),
      const Radius.circular(4),
    );
    canvas.drawRRect(waterRect, waterPaint);

    // Tank outline
    canvas.drawRRect(tankRect, strokePaint);
    canvas.drawRRect(topRect, strokePaint);

    // Small highlight on top for 3D effect
    final highlightPaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.fill;
    
    final highlightRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width * 0.2, size.height * 0.08, size.width * 0.3, size.height * 0.08),
      const Radius.circular(2),
    );
    canvas.drawRRect(highlightRect, highlightPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
