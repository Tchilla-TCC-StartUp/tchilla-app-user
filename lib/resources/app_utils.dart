import 'package:flutter/material.dart';

class AppUtils {
  static final AppUtils _instance = AppUtils._internal();
  factory AppUtils() => _instance;
  AppUtils._internal();
  final GlobalKey<ScaffoldMessengerState> snackbarKey =
      GlobalKey<ScaffoldMessengerState>();

  BuildContext get context => snackbarKey.currentContext!;
}
