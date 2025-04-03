import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_network_image.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tchilla/view/widgets/app_global_user_avatar_name.dart';

class AppResponsibleCard extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;
  final double rating;
  final int reviews;

  const AppResponsibleCard({
    super.key,
    required this.name,
    required this.role,
    required this.imageUrl,
    this.rating = 0.0,
    this.reviews = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppGlobalText(
          text: AppLocalizations.of(context)!.responsible,
          style: TextStyleEnum.h3_bold,
        ),
        AppGlobalVericalSpacing(
          value: 1.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                AppGlobalUserAvatarName(name: name),
                const AppGlobalHorizontalSpacing(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppGlobalText(
                      text: name,
                      style: TextStyleEnum.p_bold,
                    ),
                    AppGlobalText(
                      text: role,
                      style: TextStyleEnum.p_normal,
                    )
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                    ),
                    AppGlobalText(
                      text: rating.toStringAsFixed(1),
                      style: TextStyleEnum.p_bold,
                    ),
                  ],
                ),
                AppGlobalText(
                  text: "($reviews ${AppLocalizations.of(context)!.reviews})",
                  style: TextStyleEnum.p_normal,
                  color: gray700,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
