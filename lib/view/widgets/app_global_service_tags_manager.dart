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
  final List<DropdownMenuEntry<int>> dropdownMenuEntries;
  final List<int> initialSelected;
  final void Function(List<int>)? onChanged;

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
  late List<int> _selectedTagIds;

  @override
  void initState() {
    super.initState();
    _selectedTagIds = List<int>.from(widget.initialSelected);
  }

  void _addTag(int tagId) {
    if (!_selectedTagIds.contains(tagId)) {
      setState(() {
        _selectedTagIds.add(tagId);
      });
      _triggerCallback();
    }
  }

  void _removeTag(int tagId) {
    setState(() {
      _selectedTagIds.remove(tagId);
    });
    _triggerCallback();
  }

  void _triggerCallback() {
    if (widget.onChanged != null) {
      widget.onChanged!(_selectedTagIds);
    }
  }

  /// Método auxiliar para buscar o label do ID
  String _getLabelById(int id) {
    final found = widget.dropdownMenuEntries.firstWhere((e) => e.value == id,
        orElse: () => DropdownMenuEntry(label: 'Desconhecido', value: id));
    return found.label;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.helpText != null)
          Padding(
            padding: EdgeInsets.only(bottom: 8.px),
            child: AppGlobalText(
              text: widget.helpText!,
              style: TextStyleEnum.h3_bold,
              color: primary950,
            ),
          ),
        DropdownButtonFormField<int>(
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
            hintText: widget.hintText,
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
            widget.hintText ?? '',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 15.sp,
              color: primaryBorder,
            ),
          ),
          items: widget.dropdownMenuEntries.map((entry) {
            return DropdownMenuItem<int>(
              value: entry.value,
              child: Text(entry.label),
            );
          }).toList(),
          onChanged: (int? value) {
            if (value != null) {
              _addTag(value);
            }
          },
        ),
        if (_selectedTagIds.isEmpty) AppGlobalVericalSpacing(value: 1.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _selectedTagIds.map((int id) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Chip(
                  backgroundColor: primary400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.px),
                    side: const BorderSide(width: 0, color: primary400),
                  ),
                  label: Text(
                    _getLabelById(id),
                    style: GoogleFonts.inter(
                      fontSize: 9.spa,
                      color: Colors.white,
                    ),
                  ),
                  onDeleted: () => _removeTag(id),
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
