import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_size.dart';

class AppLayoutpage extends StatelessWidget {
  final Widget body;
  const AppLayoutpage({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: getAdaptativeWidth(7.w, 5.w, 3.w),
        ),
        child: body,
      ),
    );
  }
}
