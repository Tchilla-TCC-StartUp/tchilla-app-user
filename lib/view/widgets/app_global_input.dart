import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_enums.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class AppGlobalInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final AppInputType inputType;
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
  final void Function(String)? onChanged;
  final String? initialValue;
  const AppGlobalInput(
      {super.key,
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
      this.onChanged,
      this.initialValue,
      this.inputType = AppInputType.text});

  @override
  State<AppGlobalInput> createState() => _AppGlobalInputState();
}

class _AppGlobalInputState extends State<AppGlobalInput> {
  @override
  void dispose() {
    widget.controller?.dispose();
    widget.focusNode?.dispose();
    super.dispose();
  }

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    if (widget.inputType == AppInputType.password) {
      _obscureText = true;
    } else {
      _obscureText = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.helpText != null)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.spa),
            child: AppGlobalText(
              text: widget.helpText!,
              style: TextStyleEnum.h3_bold,
              color: primary950,
            ),
          ),
        TextFormField(
          initialValue: widget.initialValue,
          readOnly: widget.readOnly ?? false,
          focusNode: widget.focusNode,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          textAlign: widget.textAlign ?? TextAlign.start,
          obscureText: widget.inputType == AppInputType.password
              ? _obscureText
              : widget.obscureText ?? false,
          textInputAction: widget.textInputAction,
          validator: widget.validator,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
            color: primary950,
          ),
          decoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.hintText,
            alignLabelWithHint: true,
            hintStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
              color: const Color(0xffAFBACA),
            ),
            contentPadding: widget.contentPadding,
            prefixIcon:
                widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
            suffixIcon: widget.suffix ??
                (widget.inputType == AppInputType.password
                    ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    size: 18.px,
                    color: primary700,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
                    : (widget.suffixIcon != null
                    ? Icon(
                  widget.suffixIcon,
                  size: 18.px,
                  color: primary700,
                )
                    : null)),

            suffixIconConstraints: widget.suffixIconConstraints ,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Color(0xffAFBACA),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: primary700,
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
