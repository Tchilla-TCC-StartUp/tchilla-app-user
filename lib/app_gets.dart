import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:tchilla/util/events/navigation.dart';
import 'package:tchilla/viewmodel/forenge_password_viewmodel.dart';
import 'package:tchilla/viewmodel/login_viewmodel.dart';
import 'package:tchilla/viewmodel/onboarding_viewmodel.dart';
import 'package:tchilla/viewmodel/register_viewmodel.dart';
import 'package:tchilla/viewmodel/splash_viewmodel.dart';

class AppGets {
  static void init(GoRouter router) {
    registerEvents(router);
    registerGets();
    registerViewmodels();
  }

  static void registerEvents(GoRouter router) {
    Get.lazyPut(() => Navigation(router));
  }

  static void registerGets() {
    Get.lazyPut<OnboardingViewModel>(() => OnboardingViewModel());
  }

  static void registerViewmodels() {
    Get.lazyPut<SplashViewmodel>(() => SplashViewmodel());
    Get.lazyPut<LoginViewmodel>(() => LoginViewmodel());
    Get.lazyPut<RegisterViewmodel>(() => RegisterViewmodel());
    Get.lazyPut<ForengePasswordViewmodel>(() => ForengePasswordViewmodel());
  }
}
