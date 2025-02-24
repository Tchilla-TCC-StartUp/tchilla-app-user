import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_network_image.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class OnboardingBody extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const OnboardingBody({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppGlobalNetworkImage(
          image: image,
          width: 350.px,
          height: 350.px,
          border: 5,
        ),
        AppGlobalVericalSpacing(
          value: 2.h,
        ),
        AppGlobalText(
          text: title,
          style: TextStyleEnum.onboarding_title,
          align: TextAlign.center,
          maxLines: 2,
        ),
        AppGlobalVericalSpacing(
          value: 1.h,
        ),
        AppGlobalText(
          text: description,
          style: TextStyleEnum.p_normal,
          align: TextAlign.center,
          color: gray600,
          maxLines: 5,
        ),
      ],
    );
  }
}
