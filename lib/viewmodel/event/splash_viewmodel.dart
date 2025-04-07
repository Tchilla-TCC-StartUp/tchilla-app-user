import 'package:tchilla/viewmodel/base_viewmodel.dart';
import 'package:tchilla/viewmodel/interface/isplash_viewmodel.dart';

class SplashViewmodel extends ISplashViewmodel {
  @override
  void fristNavigation() async {
    await Future.delayed(const Duration(seconds: 2));

    await onEvent(
      checkLogin: true,
      event: (_) async {
        await navigator.navigateToHome();
      },
      onErrorAuth: () async {
        await navigator.navigateToOnboarding();
      },
    );
  }
}
