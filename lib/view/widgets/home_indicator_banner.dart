import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tchilla/resources/app_constats.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class HomeIndicatorBanner extends StatelessWidget {
  const HomeIndicatorBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: primary100, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Shimmer.fromColors(
          baseColor: primary950,
          highlightColor: primary300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                arrowDowntSvg,
                width: 20.sp,
                height: 25.sp,
              ),
              AppGlobalText(
                text: "Pode explorar nosso portfólio\nDeslizando para baixo",
                style: TextStyleEnum.p_bold,
                align: TextAlign.center,
                maxLines: 3,
              ),
              SvgPicture.asset(
                arrowDowntSvg,
                width: 20.sp,
                height: 25.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
