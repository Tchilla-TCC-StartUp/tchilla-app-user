import 'package:flutter/material.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';

class AppGlobalText extends StatelessWidget {
  final String text;
  final double? minFontSize;
  final int? maxLines;
  final TextStyleEnum style;
  Color? color;
  final TextAlign? align;
 final TextOverflow? overflow;
 final double? width;

  AppGlobalText({
    super.key,
    required this.text,
    required this.style,
    this.color,
    this.minFontSize,
    this.maxLines,
    this.align, this.overflow, this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        textAlign: align,
        overflow: overflow,
        softWrap: true,
        style: getTextStyle(style, color: color ?? primary950),
        maxLines: maxLines ?? 2,

      ),
    );
  }
}
