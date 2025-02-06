import 'package:flutter/material.dart';
import 'package:tchilla/style/app_alert_style.dart';
import 'package:tchilla/util/interface/inotificator.dart';

class Notificator extends INotificator {
  @override
  showLocalAlert(AlertStyleEnum type, String title, String message,
      final BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      getAlertStyle(
        type: type,
        title: title,
        message: message,
      ),
    );
  }
}
