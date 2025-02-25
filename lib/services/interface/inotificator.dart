import 'package:flutter/material.dart';

abstract class INotificator {
  showLocalAlert(
    final String title,
    final String message,
    final BuildContext context,
  );
  showLocalError(
    final String title,
    final String message,
    final BuildContext context,
  );
  showLocalASucess(
    final String title,
    final String message,
    final BuildContext context,
  );
}
