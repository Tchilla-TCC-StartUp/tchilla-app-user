import 'package:flutter/material.dart';
import 'package:tchilla/style/app_alert_style.dart';
import 'package:tchilla/services/interface/inotificator.dart';

class Notificator extends INotificator {
  static final Notificator _instance = Notificator._internal();
  factory Notificator() => _instance;
  Notificator._internal();
  final GlobalKey<ScaffoldMessengerState> snackbarKey =
      GlobalKey<ScaffoldMessengerState>();
  void _showAlert(String title, String message, AlertStyleEnum type) {
    snackbarKey.currentState?.showSnackBar(
      getAlertStyle(
        type: type,
        message: message,
        context: snackbarKey.currentContext!,
      ),
    );
  }

  @override
  showLocalAlert(String title, String message) {
    _showAlert(title, message, AlertStyleEnum.pedding);
  }

  @override
  showLocalASucess(String title, String message) {
    _showAlert(title, message, AlertStyleEnum.sucess);
  }

  @override
  showLocalError(String title, String message) {
    _showAlert(title, message, AlertStyleEnum.error);
  }
}
