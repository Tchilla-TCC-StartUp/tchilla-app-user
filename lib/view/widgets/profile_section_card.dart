import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/resources/app_constats.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class ProfileSectionCard extends StatelessWidget {
  final Widget leading;
  final Widget? trailing;
  final void Function()? onTap;
  final String title;
  const ProfileSectionCard({
    super.key,
    required this.leading,
    required this.title,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primary200.withOpacity(.5),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 2),
      margin: EdgeInsets.only(bottom: 15.sp),
      child: ListTile(
        leading: leading,
        onTap: onTap,
        title: AppGlobalText(
          text: title,
          style: TextStyleEnum.h3_bold,
          color: primary900,
          // color: primary400,
        ),
        trailing: trailing ??
            SvgPicture.asset(
              AppAssetsImages.arrowRightSvg2,
              width: 24.px,
              height: 24.px,
              colorFilter: const ColorFilter.mode(
                primary900,
                BlendMode.srcIn,
              ),
            ),
      ),
    );
  }
}
