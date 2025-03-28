import 'package:tchilla/viewmodel/base_viewmodel.dart';

class SplashViewmodel extends BaseViewModel {
  void fristNavigation() async {
    await Future.delayed(const Duration(seconds: 2));

    await onEvent(
      // checkLogin: true,
      event: (_) async {
      await navigator.navigateToHome();
      },
      onErrorAuth: () async {
      await navigator.navigateToOnboarding();
      },
    );
  }
}
