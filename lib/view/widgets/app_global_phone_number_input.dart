import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class AppGlobalPhoneNumberInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final bool? readOnly;

  const AppGlobalPhoneNumberInput({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.focusNode,
    this.onFieldSubmitted,
    this.readOnly,
  });

  @override
  State<AppGlobalPhoneNumberInput> createState() =>
      _AppGlobalPhoneNumberInputState();
}

class _AppGlobalPhoneNumberInputState extends State<AppGlobalPhoneNumberInput> {
  String selectedCountry = 'AO';

  final Map<String, String> countryCodes = {
    'AO': '+244',
  };

  final Map<String, String> countryFlags = {
    'AO': '🇦🇴',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.spa),
            child: AppGlobalText(
              text: widget.label!,
              style: TextStyleEnum.h3_bold,
              color: primary950,
            ),
          ),
        TextFormField(
          readOnly: widget.readOnly ?? false,
          focusNode: widget.focusNode,
          controller: widget.controller,
          maxLength: 9,
          keyboardType: TextInputType.phone,
          textInputAction: widget.textInputAction,
          validator: widget.validator,
          onFieldSubmitted: widget.onFieldSubmitted,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
            color: primary950,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
              color: const Color(0xffAFBACA),
            ),
            counterText: '',
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.px),
              child: Container(
                alignment: Alignment.center,
                width: 100.px,
                decoration: BoxDecoration(
                  color: primary100,
                  borderRadius: BorderRadius.circular(20.px),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 1.sp,
                    ),
                    value: selectedCountry,
                    items: countryCodes.keys.map((String country) {
                      return DropdownMenuItem<String>(
                        value: country,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              countryFlags[country]!,
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            AppGlobalHorizontalSpacing(
                              value: 8.px,
                            ),
                            Text(
                              countryCodes[country]!,
                              style: GoogleFonts.inter(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: primary950,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedCountry = newValue;
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
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
          ),
        ),
      ],
    );
  }
}
