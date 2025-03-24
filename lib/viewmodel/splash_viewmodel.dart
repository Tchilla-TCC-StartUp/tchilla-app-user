import 'package:tchilla/viewmodel/base_viewmodel.dart';

class SplashViewmodel extends BaseViewModel {
  void fristNavigation() async {
    await checkinLogin();
    Future.delayed(const Duration(seconds: 2), () {
      navigateToHomePage();
    });
  }

  void navigateToHomePage() async {
    // final isNetworkConnect = await checkInNetworkConnection();
    // if (isNetworkConnect) {
    // }

    if (isAuth.value) {
      await navigator.navigateToHome();
      return;
    }
    await navigator.navigateToOnboarding();
    // await navigator.navigateToHome();
    // await navigator.navigateToLoginPage();
  }
}
