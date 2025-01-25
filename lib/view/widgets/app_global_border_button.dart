import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class AppGlobalBorderButton extends StatelessWidget {
  final void Function() onPressed;
  final double? minWidth;
  final String textButton;
  const AppGlobalBorderButton({
    super.key,
    required this.onPressed,
    this.minWidth,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      elevation: 0,
      minWidth: minWidth,
      height: 55.px,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.px),
          side: const BorderSide(
            color: primary950,
            width: 1,
          )),
      child: AppGlobalText(
        text: textButton,
        style: TextStyleEnum.h3_bold,
        color: primary950,
      ),
    );
  }
}
