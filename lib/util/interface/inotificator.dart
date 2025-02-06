import 'package:flutter/material.dart';
import 'package:tchilla/style/app_alert_style.dart';

abstract class INotificator {
  showLocalAlert(
    final AlertStyleEnum type,
    final String title,
    final String message,
    final BuildContext context
  );
}
