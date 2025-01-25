import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_constats.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/util/events/navigation.dart';

class AppGlobalBackButton extends StatelessWidget {
  const AppGlobalBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        minWidth: 2.w,
        padding: const EdgeInsets.all(0),
        onPressed: Get.find<Navigation>().navigateToBack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.px),
          side: const BorderSide(color: primaryBorder),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              arrowBackSvg,
              colorFilter: const ColorFilter.mode(
                primaryBorder,
                BlendMode.srcIn,
              ),
              width: 20.px,
              height: 20.px,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
