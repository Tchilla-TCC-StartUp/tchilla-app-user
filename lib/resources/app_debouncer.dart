import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDebouncer extends GetxController {
  final int milliseconds;
  Timer? _timer;
  var isReady = true.obs;

  AppDebouncer({required this.milliseconds});

  void run(VoidCallback action) {
    if (!isReady.value) return;

    isReady.value = false;
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), () {
      isReady.value = true;
      action();
    });
  }

  void cancel() {
    _timer?.cancel();
    isReady.value = true;
  }
}
