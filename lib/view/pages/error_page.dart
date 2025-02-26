import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';

class ErrorPage extends StatelessWidget {
  final void Function([dynamic]) tryAgainEvet;
  const ErrorPage({
    super.key,
    required this.tryAgainEvet,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppGlobalText(
            text: "Alguma Coisa deu errado",
            style: TextStyleEnum.h3_bold,
          ),
          AppGlobalVericalSpacing(
            value: 1.h,
          ),
          AppGlobalTextButton(
            onPressed: tryAgainEvet,
            textButton: "Tentar Novamnte",
            minWidth: 90.w,
          )
        ],
      ),
    );
  }
}
