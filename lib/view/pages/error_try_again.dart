import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_enums.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/widgets/animation_icon.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ErrorTryAgain extends StatelessWidget {
  final String message;
  final void Function()? event;
  const ErrorTryAgain({
    super.key,
    required this.message,
    this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AnimationIcon(type: AnimationIconType.error),
          AppGlobalVericalSpacing(
            value: 1.h,
          ),
          AppGlobalText(
            text: message,
            style: TextStyleEnum.p_bold,
            maxLines: 5,
            align: TextAlign.center,
          ),
          AppGlobalVericalSpacing(
            value: 2.h,
          ),
          AppGlobalTextButton(
            onPressed: event ?? () {},
            textButton: AppLocalizations.of(context)!.try_again,
            minWidth: 90.w,
            color: Colors.redAccent.shade700,
          ),
        ],
      ),
    );
  }
}
