import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:tchilla/app_router.dart';
import 'package:tchilla/util/events/navigation.dart';
import 'package:tchilla/util/events/notificator.dart';
import 'package:tchilla/util/events/validator.dart';
import 'package:tchilla/viewmodel/detalhesproposedviewmodel.dart';
import 'package:tchilla/viewmodel/forenge_password_viewmodel.dart';
import 'package:tchilla/viewmodel/home_viewmodel.dart';
import 'package:tchilla/viewmodel/login_viewmodel.dart';
import 'package:tchilla/viewmodel/onboarding_viewmodel.dart';
import 'package:tchilla/viewmodel/profile_viewmodel.dart';
import 'package:tchilla/viewmodel/register_viewmodel.dart';
import 'package:tchilla/viewmodel/result_search_viewmodel.dart';
import 'package:tchilla/viewmodel/splash_viewmodel.dart';
import 'package:tchilla/viewmodel/view_more_viewmodel.dart';
import 'package:tchilla/viewmodel/welcome_viewmodel.dart';

class AppGets {
  static void init() {
    Get.lazyPut<AppRouter>(() => AppRouter());
    registerEvents(Get.find<AppRouter>().router);
    registerGets();
    registerViewmodels();
  }

  static void registerEvents(GoRouter router) {
    Get.lazyPut(() => Navigation(router));
    Get.lazyPut(() => Notificator());
    Get.lazyPut(() => Validator());
    Get.lazyPut(() {});
  }

  static void registerGets() {
    Get.lazyPut<OnboardingViewModel>(
      () => OnboardingViewModel(
        navigator: Get.find(),
      ),
    );
    Get.lazyPut<ResultSearchViewModel>(
      () => ResultSearchViewModel(
        navigator: Get.find(),
        notificator: Get.find(),
      ),
    );
  }

  static void registerViewmodels() {
    Get.lazyPut<SplashViewmodel>(
      () => SplashViewmodel(
        navigator: Get.find(),
        notificator: Get.find(),
      ),
    );
    Get.lazyPut<LoginViewmodel>(
      () => LoginViewmodel(
        navigator: Get.find(),
        notificator: Get.find(),
        validator: Get.find(),
      ),
    );
    Get.lazyPut<RegisterViewmodel>(
      () => RegisterViewmodel(
        navigator: Get.find(),
        notificator: Get.find(),
        validator: Get.find(),
      ),
    );
    Get.lazyPut<ForengePasswordViewmodel>(
      () => ForengePasswordViewmodel(
        navigator: Get.find(),
        notificator: Get.find(),
        validator: Get.find(),
      ),
    );
    Get.lazyPut<HomeViewModel>(
      () => HomeViewModel(
        navigator: Get.find(),
      ),
    );
    Get.lazyPut<WelcomeViewmodel>(
      () => WelcomeViewmodel(
        navigator: Get.find(),
      ),
    );
    Get.lazyPut<DetalheProposedViewModel>(
      () => DetalheProposedViewModel(
        navigator: Get.find(),
      ),
    );
    Get.lazyPut<ViewMoreViewmodel>(
      () => ViewMoreViewmodel(
        navigator: Get.find(),
        notificator: Get.find(),
      ),
    );
    Get.lazyPut<ProfileViewmodel>(
      () => ProfileViewmodel(
        navigator: Get.find(),
        notificator: Get.find(),
      ),
    );
  }
}
