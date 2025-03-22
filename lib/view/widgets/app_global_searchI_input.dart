import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class AppGlobalSearchInput<T extends Object> extends StatelessWidget {
  const AppGlobalSearchInput({
    super.key,
    required this.items,
    this.width,
    this.hintText,
    this.helpText,
    required this.displayStringForOption,
    required this.onSelected,
    this.optionBuilder,
  });

  final List<T> items;
  final double? width;
  final String? hintText;
  final String? helpText;
  final void Function(T?) onSelected;
  final String Function(T) displayStringForOption;
  final Widget Function(BuildContext, T)? optionBuilder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (helpText != null)
            Padding(
              padding: EdgeInsets.only(bottom: 8.px),
              child: AppGlobalText(
                text: helpText!,
                style: TextStyleEnum.h3_bold,
                color: primary950,
              ),
            ),
          Autocomplete<T>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) {
                return Iterable<T>.empty();
              }
              return items.where(
                  (item) => displayStringForOption(item).toLowerCase().contains(
                        textEditingValue.text.toLowerCase(),
                      ));
            },
            displayStringForOption: displayStringForOption,
            onSelected: onSelected,
            fieldViewBuilder:
                (context, controller, focusNode, onFieldSubmitted) {
              return TextFormField(
                controller: controller,
                focusNode: focusNode,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: primary950,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.grey.shade500),
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
              );
            },
            optionsViewBuilder: (context, onSelectedFn, options) {
              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  borderRadius: BorderRadius.circular(6),
                  elevation: 4,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      final option = options.elementAt(index);
                      return ListTile(
                        title: optionBuilder != null
                            ? optionBuilder!(context, option)
                            : Text(displayStringForOption(option)),
                        onTap: () => onSelectedFn(option),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
