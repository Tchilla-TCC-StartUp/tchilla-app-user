import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorTryAgain extends StatelessWidget {
  final String message;
  final void Function([dynamic]) tryAgainEvet;
  const ErrorTryAgain({
    super.key,
    required this.tryAgainEvet,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppGlobalText(
          text: message,
          style: TextStyleEnum.p_bold,
          maxLines: 5,
          align: TextAlign.center,
        ),
        AppGlobalVericalSpacing(
          value: 1.h,
        ),
        AppGlobalTextButton(
          onPressed: tryAgainEvet,
          textButton: AppLocalizations.of(context)!.try_again,
          minWidth: 90.w,
        )
      ],
    );
  }
}
