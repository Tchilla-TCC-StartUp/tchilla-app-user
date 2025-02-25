import 'package:flutter/material.dart';
import 'package:tchilla/style/app_alert_style.dart';
import 'package:tchilla/services/interface/inotificator.dart';

class Notificator extends INotificator {
  @override
  showLocalAlert(
    String title,
    String message,
    BuildContext context,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      getAlertStyle(
        type: AlertStyleEnum.pedding,
        title: title,
        message: message,
      ),
    );
  }

  @override
  showLocalASucess(String title, String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      getAlertStyle(
        type: AlertStyleEnum.sucess,
        title: title,
        message: message,
      ),
    );
  }

  @override
  showLocalError(String title, String message, BuildContext context) {
    getAlertStyle(
      type: AlertStyleEnum.error,
      title: title,
      message: message,
    );
  }
}
