import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/view/widgets/app_global_shimmer.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayoutpage(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppGlobalVericalSpacing(
          value: 5.h,
        ),
        Row(
          children: [
            AppGlobalShimmer(
              width: 50.px,
              height: 50.px,
              borderRadius: 50,
            ),

            const AppGlobalHorizontalSpacing(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppGlobalShimmer(width: 100.px, height: 10.px),
                AppGlobalVericalSpacing(),
                AppGlobalShimmer(width: 200.px, height: 15.px)
              ],
            )
          ],
        ),
        AppGlobalVericalSpacing(
          value: 3.h,
        ),
        AppGlobalShimmer(width: 300.px, height: 20.px),
        AppGlobalVericalSpacing(),
        AppGlobalShimmer(width: 250.px, height: 20.px),
        AppGlobalVericalSpacing(
          value: 3.h,
        ),
        AppGlobalShimmer(width: 100.w, height:600.px, borderRadius: 16,),
        AppGlobalVericalSpacing(
          value: 2.h,
        ),
        AppGlobalShimmer(width: 200.px, height: 20.px),

      ],
    ));
  }
}
