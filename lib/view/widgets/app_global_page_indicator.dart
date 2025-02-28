import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/colors.dart';

class AppGlobalPageIndicator extends StatelessWidget {
  final PageController controller;
  final int count;
  final Color dotColor;
  final Color activeDotColor;
  final double dotWidth;
  final double dotHeight;

  const AppGlobalPageIndicator({
    Key? key,
    required this.controller,
    required this.count,
    this.dotColor = gray400,
    this.activeDotColor = primary950,
    this.dotWidth = 8.0,
    this.dotHeight = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        int currentIndex = (controller.page ?? 0).round();

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(count, (index) {
            bool isActive = index == currentIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4.px),
              width: isActive ? dotWidth * 3.5 : dotWidth,
              height: dotHeight,
              decoration: BoxDecoration(
                color: isActive ? activeDotColor : dotColor,
                borderRadius: BorderRadius.circular(8),
              ),
            );
          }),
        );
      },
    );
  }
}
