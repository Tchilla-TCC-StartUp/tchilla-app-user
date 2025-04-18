import 'package:flutter/material.dart';
import 'package:free_map/fm_models.dart';
import 'package:free_map/fm_search_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/colors.dart';

import '../../resources/app_enums.dart';

class GlobalSearchLocal extends StatefulWidget {
 FmData? address;
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
  final void Function(String)? onChanged;
  final String? initialValue;
  GlobalSearchLocal({super.key, this.controller, this.label,  this.hintText, this.keyboardType, required this.obscureText, this.validator, required this.textInputAction, this.prefixIcon, this.suffixIcon, this.onSuffixIconPressed, this.helpText, this.suffix, this.textAlign, this.readOnly, this.suffixIconConstraints, this.contentPadding, this.focusNode, this.onFieldSubmitted, this.onChanged, this.initialValue, this.address});

  @override
  State<GlobalSearchLocal> createState() => _GlobalSearchLocalState();
}

class _GlobalSearchLocalState extends State<GlobalSearchLocal> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  FmSearchField(
      selectedValue: widget.address,
      searchParams: const FmSearchParams(),
      onSelected: (data) => widget.address = data,
      textFieldBuilder: (focus, controller, onChanged) {
        return TextFormField(
          focusNode: focus,
          onChanged: onChanged,
          controller: controller,
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
            suffixIcon: widget.suffix ,
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
        );
      },
    );
  }
}
