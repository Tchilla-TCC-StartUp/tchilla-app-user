import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/view/widgets/app_global_shimmer.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';

class WelcomeShimmer extends StatelessWidget {
  const WelcomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppGlobalVericalSpacing(value: 10.h,),
        AppGlobalShimmer(width: 350.px, height: 350.px),
        AppGlobalVericalSpacing(value: 3.h,),
        AppGlobalShimmer(width: 350.px, height: 20.px, borderRadius: 10,),
        AppGlobalVericalSpacing(),
        AppGlobalShimmer(width: 250.px, height: 20.px, borderRadius: 10, ),
        AppGlobalVericalSpacing(value: 5.h,),
        AppGlobalShimmer(width: 350.px, height: 15.px),
        AppGlobalVericalSpacing(),
        AppGlobalShimmer(width: 350.px, height: 15.px),
        AppGlobalVericalSpacing(),
        AppGlobalShimmer(width: 300.px, height: 15.px),

      ],
    );
  }
}
