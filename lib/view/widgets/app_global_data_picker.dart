import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class AppGlobalDatePicker extends StatefulWidget {
  final String? helpText;
  final String hintText;
  final double width;
  final DateTime? initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final ValueChanged<DateTime> onDateSelected;
  final TextStyle? hintTextStyle;
  final TextStyle? selectedTextStyle;
  final BoxDecoration? decoration;

  const AppGlobalDatePicker({
    Key? key,
    this.helpText,
    required this.hintText,
    required this.width,
    this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onDateSelected,
    this.hintTextStyle,
    this.selectedTextStyle,
    this.decoration,
  }) : super(key: key);

  @override
  _AppGlobalDatePickerState createState() => _AppGlobalDatePickerState();
}

class _AppGlobalDatePickerState extends State<AppGlobalDatePicker> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? widget.initialDate ?? DateTime.now(),
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      widget.onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.helpText != null)
          Padding(
            padding: EdgeInsets.only(bottom: 10.spa),
            child: AppGlobalText(
              text: widget.helpText!,
              style: TextStyleEnum.h3_bold,
              color: primary950,
            ),
          ),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            width: widget.width,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.5),
            decoration: BoxDecoration(
              border: Border.all(color: primaryBorder),
              borderRadius: BorderRadius.circular(6),
            ),
            child: AppGlobalText(
              text: _selectedDate != null
                  ? formatDateToReadableString(_selectedDate!)
                  : widget.hintText,
              style: TextStyleEnum.p_medium,
            ),
          ),
        ),
      ],
    );
  }

  String formatDateToReadableString(DateTime date) {
    const months = [
      "JAN",
      "FEV",
      "MAR",
      "ABR",
      "MAI",
      "JUN",
      "JUL",
      "AGO",
      "SET",
      "OUT",
      "NOV",
      "DEZ"
    ];
    String day = date.day.toString().padLeft(2, '0');
    String month = months[date.month - 1];
    String year = date.year.toString();
    return "$day $month $year";
  }
}
