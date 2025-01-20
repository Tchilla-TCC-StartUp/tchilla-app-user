import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_constats.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/util/events/navigation.dart';

class AppGlobalBackButton extends StatelessWidget {
  const AppGlobalBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final navigation = Modular.get<Navigation>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        minWidth: 2.w,
        padding: EdgeInsets.all(0),
        onPressed: navigation.navigateToBack,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.px),
            side: BorderSide(color: primary200)),
        child: Stack(
           alignment: Alignment.center,
          children: [
            Positioned(
              top: 9,
              bottom: 3,
              child: SvgPicture.asset(
                arrowBackSvg,
                color: primary950,
                width: 40.px,
                height: 40.px,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
