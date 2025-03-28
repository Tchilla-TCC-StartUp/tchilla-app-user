import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/view/widgets/app_global_show_and_hide_animation.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';

class AppAnimationLogo extends StatelessWidget {
  final List<FocusNode> focusNode;
  const AppAnimationLogo({
    super.key,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return AppGlobalShowAndHideAnimation(
      focusNodes: focusNode,
      children: [
        AppGlobalVericalSpacing(
          value: 2.h,
        ),
        Image.asset(
          AppAssetsImages.logotipoPng,
          width: 40.w,
        ),
        AppGlobalVericalSpacing(
          value: 2.h,
        ),
      ],
    );
  }
}
