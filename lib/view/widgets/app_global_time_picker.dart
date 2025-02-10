import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class AppGlobalTimePicker extends StatefulWidget {
  final String? helpText;
  final String hintText;
  final double width;
  final TimeOfDay? initialDate;

  final ValueChanged<TimeOfDay> onDateSelected;
  final TextStyle? hintTextStyle;
  final TextStyle? selectedTextStyle;
  final BoxDecoration? decoration;

  const AppGlobalTimePicker({
    Key? key,
    this.helpText,
    required this.hintText,
    required this.width,
    this.initialDate,
    required this.onDateSelected,
    this.hintTextStyle,
    this.selectedTextStyle,
    this.decoration,
  }) : super(key: key);

  @override
  _AppGlobalTimePickerState createState() => _AppGlobalTimePickerState();
}

class _AppGlobalTimePickerState extends State<AppGlobalTimePicker> {
  TimeOfDay? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedDate ?? widget.initialDate ?? TimeOfDay.now(),
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
              align: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  String formatDateToReadableString(TimeOfDay date) {
    String hour = date.hour.toString();
    String minut = date.minute.toString();

    return "$hour : $minut";
  }
}
