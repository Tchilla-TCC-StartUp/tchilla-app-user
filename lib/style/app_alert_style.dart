import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

enum AlertStyleEnum {
  sucess,
  error,
  pedding,
  info,
}

SnackBar getAlertStyle({
  required AlertStyleEnum type,
  required String title,
  required String message,
}) {
  Color backgroundColor;
  Icon icon;

  switch (type) {
    case AlertStyleEnum.sucess:
      backgroundColor = Colors.green.shade600;
      icon = const Icon(Icons.check_circle, color: Colors.white);
      break;
    case AlertStyleEnum.error:
      backgroundColor = Colors.red.shade600;
      icon = const Icon(Icons.error, color: Colors.white);
      break;
    case AlertStyleEnum.pedding:
      backgroundColor = Colors.orange.shade600;
      icon = const Icon(
        Icons.hourglass_bottom,
        color: Colors.white,
      );
      break;
    case AlertStyleEnum.info:
      backgroundColor = primary600;
      icon = const Icon(
        Icons.info,
        color: Colors.white,
      );
      break;
  }

  return SnackBar(
    backgroundColor: backgroundColor,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.px)),
    duration: const Duration(seconds: 3),
    content: Row(
      children: [
        icon,
        const AppGlobalHorizontalSpacing(
          value: 8.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppGlobalText(
                text: title,
                style: TextStyleEnum.h3_bold,
                color: gray50,
              ),
              AppGlobalText(
                text: message,
                style: TextStyleEnum.p_medium,
                color: gray50,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
