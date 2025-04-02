import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_debouncer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_loading.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class AppGlobalTextButton extends StatelessWidget {
  AppGlobalTextButton({
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
  final AppDebouncer _debouncer = AppDebouncer(milliseconds: 3000);

  void _handlePress() {
    if (!_debouncer.isReady.value) return;
    onPressed();
    _debouncer.run(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Opacity(
        opacity: _debouncer.isReady.value ? 1 : 0.5,
        child: MaterialButton(
          color: primary950,
          // color: _debouncer.isReady.value ? primary950 : gray400,
          elevation: 0,
          minWidth: minWidth,
          height: 55.px,
          onPressed: _handlePress,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.px),
          ),
          child: isLoading
              ? const AppGlobalLoading(color: primary50)
              : AppGlobalText(
                  text: textButton,
                  style: TextStyleEnum.h3_medium,
                  color: primary50,
                  // color: _debouncer.isReady.value ? primary50 : gray900,
                ),
        ),
      );
    });
  }
}
