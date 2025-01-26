import 'package:flutter/material.dart';

class CircleSeriesPainter extends CustomPainter {
  final Color circleColor; 
  final double spacing;
  final double strokeWidth;

  CircleSeriesPainter({
    required this.circleColor,
    this.spacing = 10.0, 
    this.strokeWidth = 2.0, 
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2); 
    final paint = Paint()
      ..color = circleColor
      ..strokeWidth = strokeWidth
      ..style =
          PaintingStyle.stroke; 

   
    final radii = [
      size.width / 8,
      size.width / 5 + spacing, 
      size.width / 4 + 4 * spacing, 
    ];

    
    for (double radius in radii) {
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
