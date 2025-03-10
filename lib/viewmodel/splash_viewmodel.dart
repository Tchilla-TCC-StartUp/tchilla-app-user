import 'package:tchilla/viewmodel/base_viewmodel.dart';

class SplashViewmodel extends BaseViewModel {
  navigateToHomePage() async {
    // final isNetworkConnect = await checkInNetworkConnection();
    // if (isNetworkConnect) {

    // }

    final isLogin = await checkinLogin();
    if (isLogin) {
      return await navigator.navigateToHome();
    }
    // await navigator.navigateToOnboarding();
    await navigator.navigateToHome();
  }
}
