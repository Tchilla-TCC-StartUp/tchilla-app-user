import 'package:get/get.dart';
import 'package:tchilla/util/events/navigation.dart';
import 'package:tchilla/util/events/notificator.dart';

class SplashViewmodel {
  final Navigation navigator;
  final Notificator notificator;

  SplashViewmodel({
    required this.navigator,
    required this.notificator,
  });

  navigateToHomePage() async {
    await Future.delayed(const Duration(seconds: 3));
    await navigator.navigateToOnboarding();
    // await _navigation.navigateToHome();
  }
}
