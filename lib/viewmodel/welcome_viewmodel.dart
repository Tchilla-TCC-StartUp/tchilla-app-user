import 'package:get/get.dart';
import 'package:tchilla/util/events/navigation.dart';

class WelcomeViewmodel {
  final Navigation navigator;

  WelcomeViewmodel({required this.navigator});

  navigateToLogin() {
    navigator.navigateToLoginPage();
  }

  navigateToRegister() {
    navigator.navigateToRegisterPage();
  }

  enteraVisitor() {
    navigator.navigateToHome();
  }
}
