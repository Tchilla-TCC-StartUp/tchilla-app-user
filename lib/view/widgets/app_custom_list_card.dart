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
            primary700,
            BlendMode.srcIn,
          ),
          width: 35.px,
          height: 35.px,
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
              color: primary700,
              align: TextAlign.justify,
            ),
          ],
        ),
      ],
    );
  }
}
