import 'package:tchilla/viewmodel/base_viewlmodel.dart';

class SplashViewmodel extends BaseViewlmodel {
  SplashViewmodel({
    required super.notificator,
    required super.validator,
    required super.navigator,
    required super.loger,
  });

  navigateToHomePage() async {
    await Future.delayed(const Duration(seconds: 3));
    await navigator.navigateToOnboarding();
    // await _navigation.navigateToHome();
  }
}
