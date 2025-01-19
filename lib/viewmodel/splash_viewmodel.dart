import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tchilla/util/events/navigation.dart';

class SplashViewmodel extends ChangeNotifier {
  final Navigation _navigation = Modular.get<Navigation>();

  Future<void> navigateToHomePage() async {
    await Future.delayed(const Duration(seconds: 5));
    await _navigation.navigateToLoginPage();
  }
}
