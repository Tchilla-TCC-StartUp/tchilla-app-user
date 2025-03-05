import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class AppGlobalTextButton extends StatelessWidget {
  const AppGlobalTextButton({
    super.key,
    required this.onPressed,
    this.minWidth,
    this.isLoading = false,
    required this.textButton,
  });

  final void Function() onPressed;
  final double? minWidth;
  final String textButton;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(microseconds: 800),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: isLoading
          ? Center(
              key: const ValueKey<int>(1), 
              child: Container(
                width: 150.px,
                height: 55.px,
                decoration: BoxDecoration(
                  color: primary950,
                  borderRadius: BorderRadius.circular(8.px),
                ),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: primary50,
                  ),
                ),
              ),
            )
          : MaterialButton(
              key: const ValueKey<int>(2), 
              color: primary950,
              splashColor: primary900,
              elevation: 0,
              minWidth: minWidth,
              height: 55.px,
              onPressed: onPressed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.px),
              ),
              child: AppGlobalText(
                text: textButton,
                style: TextStyleEnum.h3_medium,
                color: primary50,
              ),
            ),
    );
  }
}
