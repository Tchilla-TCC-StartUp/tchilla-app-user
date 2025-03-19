import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class AppAuthDivider extends StatelessWidget {
  final String text;
  const AppAuthDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Divider(
          color: gray400,
        )),
        AppGlobalText(
          text: text,
          align: TextAlign.center,
          style: TextStyleEnum.p_normal,
          color: gray600,
        ),
        const Expanded(
            child: Divider(
          color: gray400,
        )),
      ],
    );
  }
}
