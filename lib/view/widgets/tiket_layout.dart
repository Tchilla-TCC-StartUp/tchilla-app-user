import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/zig_zag_divider.dart';

class CustomTicketShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const radius = 16.0;
    final path = Path()
      ..moveTo(0, radius)
      ..quadraticBezierTo(0, 0, radius, 0)
      ..lineTo(size.width - radius, 0)
      ..quadraticBezierTo(size.width, 0, size.width, radius)
      ..lineTo(size.width, size.height / 2 - 20)
      ..quadraticBezierTo(
          size.width * 0.90, size.height / 2, size.width, size.height / 2 + 20)
      ..lineTo(size.width, size.height - radius)
      ..quadraticBezierTo(
          size.width, size.height, size.width - radius, size.height)
      ..lineTo(radius, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - radius)
      ..lineTo(0, size.height / 2 + 20)
      ..quadraticBezierTo(
          size.width * 0.10, size.height / 2, 0, size.height / 2 - 20)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class TicketLayout extends StatelessWidget {
  final Widget top;
  final Widget bottom;
  const TicketLayout({super.key, required this.top, required this.bottom});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          boxShadow: const [
            BoxShadow(
              color: gray300,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: ClipPath(
          clipper: CustomTicketShape(),
          child: Container(
            width: 320.px,
            height: 410.px,
            decoration: BoxDecoration(
              color: const Color(0xffF6F6F6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Expanded(child: top),
                const ZigZagDivider(),
                Expanded(child: bottom),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
