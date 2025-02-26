import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/colors.dart';

enum TextStyleEnum {
  p_normal,
  p_light,
  p_medium,
  p_bold,
  h1_normal,
  h1_bold,
  h1_medium,
  h2_normal,
  h2_bold,
  h2_medium,
  h3_bold,
  h3_medium,
  h3_normal,
  italic,
  underline,
  caption,
  button_text,
  subtitle,
  overline,
  onboarding_title,
}

TextStyle getTextStyle(
  TextStyleEnum style, {
  Color color = primary950,
}) {
  switch (style) {
    case TextStyleEnum.p_normal:
      return GoogleFonts.inter(
        fontWeight: FontWeight.normal,
        fontSize: 15.sp,
        color: color,
      );
    case TextStyleEnum.p_light:
      return GoogleFonts.inter(
        fontWeight: FontWeight.w300,
        fontSize: 15.sp,
        color: color,
      );
    case TextStyleEnum.p_medium:
      return GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 15.sp,
        color: color,
      );
    case TextStyleEnum.p_bold:
      return GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 15.sp,
        color: color,
      );
    case TextStyleEnum.h1_bold:
      return GoogleFonts.inter(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        color: color,
      );
    case TextStyleEnum.h1_medium:
      return GoogleFonts.inter(
        fontSize: 30.sp,
        fontWeight: FontWeight.w500,
        color: color,
      );
    case TextStyleEnum.h1_normal:
      return GoogleFonts.inter(
        fontSize: 30.sp,
        fontWeight: FontWeight.normal,
        color: color,
      );
    case TextStyleEnum.h2_bold:
      return GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: color,
      );
    case TextStyleEnum.h2_medium:
      return GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: color,
      );
    case TextStyleEnum.h2_normal:
      return GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.normal,
        color: color,
      );
    case TextStyleEnum.h3_bold:
      return GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: color,
      );
    case TextStyleEnum.h3_normal:
      return GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: color,
      );
    case TextStyleEnum.h3_medium:
      return GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: color,
      );
    case TextStyleEnum.italic:
      return GoogleFonts.inter(
        fontStyle: FontStyle.italic,
        color: color,
      );
    case TextStyleEnum.underline:
      return GoogleFonts.inter(
        decoration: TextDecoration.underline,
        color: color,
      );
    case TextStyleEnum.caption:
      return GoogleFonts.inter(
        fontSize: 12.sp,
        color: color,
      );
    case TextStyleEnum.button_text:
      return GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
        color: color,
      );
    case TextStyleEnum.subtitle:
      return GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: color,
      );
    case TextStyleEnum.overline:
      return GoogleFonts.inter(
        fontSize: 10.sp,
        color: color,
      );
    case TextStyleEnum.onboarding_title:
      return GoogleFonts.inter(
        fontSize: 21.sp,
        fontWeight: FontWeight.w900,
        color: color,
      );
    default:
      return GoogleFonts.inter(
        color: color,
      );
  }
}
