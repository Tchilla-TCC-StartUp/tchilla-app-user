import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class AppGlobalImageButton extends StatelessWidget {
  const AppGlobalImageButton({
    super.key,
    required this.onPressed,
    this.minWidth,
    this.color,
    required this.child,
  });

  final void Function() onPressed;
  final double? minWidth;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      splashColor: color,
      elevation: 0,
      hoverColor: Colors.transparent,
      minWidth: minWidth,
      hoverElevation: 0,
      height: 55.px,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.px),
      ),
      child: child,
    );
  }
}
