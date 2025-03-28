import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/colors.dart';

class ZigZagLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = gray400
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: CustomPaint(
        size: Size(
          100.w,
          5,
        ),
        painter: ZigZagLinePainter(),
      ),
    );
  }
}
