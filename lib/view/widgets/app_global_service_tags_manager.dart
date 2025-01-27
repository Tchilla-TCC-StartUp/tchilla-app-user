import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class AppGlobalServiceTagsManager extends StatefulWidget {
  final String? helpText;
  final String? hintText;
  final List<DropdownMenuEntry<String>> dropdownMenuEntries;
  final List<String> initialSelected;
  final void Function(List<String>)? onChanged;

  const AppGlobalServiceTagsManager({
    Key? key,
    this.helpText,
    this.hintText,
    required this.dropdownMenuEntries,
    this.initialSelected = const [],
    this.onChanged,
  }) : super(key: key);

  @override
  State<AppGlobalServiceTagsManager> createState() =>
      _AppGlobalServiceTagsManagerState();
}

class _AppGlobalServiceTagsManagerState
    extends State<AppGlobalServiceTagsManager> {
  late List<String> _selectedTags;

  @override
  void initState() {
    super.initState();
    _selectedTags = List<String>.from(widget.initialSelected);
  }

  void _addTag(String tag) {
    if (!_selectedTags.contains(tag)) {
      setState(() {
        _selectedTags.add(tag);
      });
      // _triggerCallback();
    }
  }

  void _removeTag(String tag) {
    setState(() {
      _selectedTags.remove(tag);
    });
    _triggerCallback();
  }

  void _triggerCallback() {
    if (widget.onChanged != null) {
      widget.onChanged!(_selectedTags);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.helpText != null)
          Padding(
            padding: EdgeInsets.only(bottom: 5.spa),
            child: AppGlobalText(
              text: widget.helpText!,
              style: TextStyleEnum.h3_bold,
              color: primary950,
            ),
          ),
        DropdownButtonFormField<String>(
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: primaryBorder,
          ),
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
            color: primary950,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText, // Mantém o hint text no campo
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
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Color(0xffAFBACA),
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Color(0xffAFBACA),
                width: 1,
              ),
            ),
          ),
          hint: Text(
            // Adiciona o texto do hint fixo
            widget.hintText!,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 15.sp,
              color: primaryBorder,
            ),
          ),
          items: widget.dropdownMenuEntries.map((entry) {
            return DropdownMenuItem(
              value: entry.value,
              child: Text(entry.label),
            );
          }).toList(),
          onChanged: (String? value) {
            if (value != null) {
              _addTag(value);
            }
          },
        ),
        if (_selectedTags.isEmpty) AppGlobalVericalSpacing(value: 1.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Define rolagem horizontal
          child: Row(
            children: _selectedTags.map((String tag) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Chip(
                  backgroundColor: primary400,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.px),
                      side: const BorderSide(width: 0, color: primary400)),
                  label: Text(
                    tag,
                    style:
                        GoogleFonts.inter(fontSize: 9.spa, color: Colors.white),
                  ),
                  onDeleted: () => _removeTag(tag),
                  deleteIcon: const Icon(
                    Icons.close,
                    size: 12,
                    color: Colors.white,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
