import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_debouncer.dart';

class AppGlobalImageButton extends StatelessWidget {
  AppGlobalImageButton({
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
  final AppDebouncer _debouncer = AppDebouncer(milliseconds: 3000);

  void _handlePress() {
    if (!_debouncer.isReady.value) return;
    onPressed();
    _debouncer.run(() {});
  }

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
      onPressed: _handlePress,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.px),
      ),
      child: child,
    );
  }
}
