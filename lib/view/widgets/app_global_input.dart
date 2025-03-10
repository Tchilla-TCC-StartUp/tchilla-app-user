import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class AppGlobalInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final TextInputAction textInputAction;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final String? helpText;
  final Widget? suffix;
  final TextAlign? textAlign;
  final bool? readOnly;
  final BoxConstraints? suffixIconConstraints;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;

  const AppGlobalInput({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.textInputAction = TextInputAction.done,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.helpText,
    this.focusNode,
    this.onFieldSubmitted,
    this.readOnly,
    this.suffix,
    this.textAlign,
    this.suffixIconConstraints,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (helpText != null)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.spa),
            child: AppGlobalText(
              text: helpText!,
              style: TextStyleEnum.h3_bold,
              color: primary950,
            ),
          ),
        TextFormField(
          readOnly: readOnly ?? false,
          focusNode: focusNode,
          controller: controller,
          keyboardType: keyboardType,
          textAlign: textAlign ?? TextAlign.start,
          obscureText: obscureText,
          textInputAction: textInputAction,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
            color: primary950,
          ),
          decoration: InputDecoration(
            labelText: label,
            hintText: hintText,
            hintStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
              color: const Color(0xffAFBACA),
            ),
            contentPadding: contentPadding,
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            suffix: suffix,
            suffixIconConstraints: suffixIconConstraints,
            suffixIcon: suffixIcon != null
                ? IconButton(
                    icon: Icon(
                      suffixIcon,
                      color: primary400,
                    ),
                    onPressed: onSuffixIconPressed,
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Color(0xffAFBACA),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Color(0xffAFBACA),
                width: 1,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Color(0xffAFBACA),
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
