import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/view/widgets/app_global_shimmer.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';

class ProposedListShimmer extends StatelessWidget {
  const ProposedListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppGlobalShimmer(
                width: 35.w,
                height: 12.h,
              ),
              const AppGlobalHorizontalSpacing(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppGlobalShimmer(
                    width: 150.px,
                    height: 15,
                  ),
                  const AppGlobalVericalSpacing(),
                  AppGlobalShimmer(
                    width: 200.px,
                    height: 15,
                  ),
                  const AppGlobalVericalSpacing(),
                  AppGlobalShimmer(
                    width: 200.px,
                    height: 10,
                  ),
                  const AppGlobalVericalSpacing(),
                  AppGlobalShimmer(
                    width: 80.px,
                    height: 10,
                  ),
                  const AppGlobalVericalSpacing(),
                  AppGlobalShimmer(
                    width: 100.px,
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
