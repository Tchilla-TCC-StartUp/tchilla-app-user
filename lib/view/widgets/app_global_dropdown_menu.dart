import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class AppGlobalDropdownMenu extends StatelessWidget {
  const AppGlobalDropdownMenu({
    super.key,
    required this.dropdownMenuEntries,
    this.width,
    this.hintText,
    this.helpText,
  });
  final List<DropdownMenuEntry<String>> dropdownMenuEntries;
  final double? width;
  final String? hintText;
  final String? helpText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (helpText != null)
          Padding(
            padding: EdgeInsets.only(bottom: 10.spa),
            child: AppGlobalText(
              text: helpText!,
              style: TextStyleEnum.h3_bold,
              color: primary950,
            ),
          ),
        DropdownMenu(
          hintText: hintText,
          textStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
            color: primary950,
          ),
          width: width,
          selectedTrailingIcon: const Icon(
            Icons.keyboard_arrow_up,
            color: primaryBorder,
          ),
          trailingIcon: const Icon(
            Icons.keyboard_arrow_down,
            color: primaryBorder,
          ),
          dropdownMenuEntries: dropdownMenuEntries,
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: primaryBorder,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: primaryBorder,
                width: 1,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: primaryBorder,
                width: 1,
              ),
            ),
          ),
          menuStyle: MenuStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
