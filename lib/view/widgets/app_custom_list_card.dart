import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_back_button.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class AppCustomListCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;

  const AppCustomListCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppGlobalBackButton(
          minWidth: 35.px,
        ),
        Row(
          children: [
            SvgPicture.asset(
              iconPath,
              colorFilter: const ColorFilter.mode(
                primary400,
                BlendMode.srcIn,
              ),
              width: 35.px,
              height: 35.px,
            ),
            AppGlobalHorizontalSpacing(
              value: 3.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppGlobalText(
                  text: title,
                  style: TextStyleEnum.h3_bold,
                  color: primary400,
                  align: TextAlign.justify,
                ),
                AppGlobalVericalSpacing(
                  value: 2.px,
                ),
                AppGlobalText(
                  text: subtitle,
                  style: TextStyleEnum.p_medium,
                  color: primary400,
                  align: TextAlign.justify,
                ),
              ],
            ),
          ],
        ),
        AppGlobalHorizontalSpacing(
          value: 35.px,
        )
      ],
    );
  }
}
