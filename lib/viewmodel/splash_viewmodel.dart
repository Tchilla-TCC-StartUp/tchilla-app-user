import 'package:get/get.dart';
import 'package:tchilla/util/events/navigation.dart';

class SplashViewmodel {
  final Navigation _navigation = Get.find<Navigation>();

  navigateToHomePage() async {
    await Future.delayed(const Duration(seconds: 3));
    await _navigation.navigateToOnboarding();
    // await _navigation.navigateToHome();
  }
}
