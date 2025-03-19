import 'package:flutter/material.dart';
import 'package:tchilla/style/colors.dart';

class ZigZagLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = gray200
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Path path = Path();

    double step = 5; 
    for (double x = 0; x < size.width; x += step) {
      if ((x ~/ step) % 2 == 0) {
        path.lineTo(x, 0);
      } else {
        path.lineTo(x, size.height);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class ZigZagDivider extends StatelessWidget {
  const ZigZagDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPaint(
          size: const Size(
              300, 5),
          painter: ZigZagLinePainter(),
        ),
      ],
    );
  }
}
