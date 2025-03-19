import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          iconPath,
          colorFilter: const ColorFilter.mode(
            primaryHighligth,
            BlendMode.srcIn,
          ),
          width: 34.px,
          height: 34.px,
        ),
        AppGlobalHorizontalSpacing(
          value: 2.w,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppGlobalText(
              text: "$title - $subtitle",
              style: TextStyleEnum.p_bold,
              color: primary900,
              align: TextAlign.justify,
            ),
          ],
        ),
      ],
    );
  }
}
