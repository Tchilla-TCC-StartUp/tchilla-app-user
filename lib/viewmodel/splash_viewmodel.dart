import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchilla/util/events/navigation.dart';

class SplashViewmodel extends ChangeNotifier {
  final Navigation _navigation = Get.find<Navigation>();

  Future<void> navigateToHomePage() async {
    await Future.delayed(const Duration(seconds: 5));
    await _navigation.navigateToOnboarding();
  }
}
