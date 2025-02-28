import 'package:flutter/material.dart';

abstract class INotificator {
  showLocalAlert(
    final String title,
    final String message,
  );
  showLocalError(
    final String title,
    final String message,
  );
  showLocalASucess(
    final String title,
    final String message,
  );
}
