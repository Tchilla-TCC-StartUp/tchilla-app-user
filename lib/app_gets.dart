import 'package:get/get.dart';
import 'package:tchilla/resources/app_routes.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/services/events/notificator.dart';
import 'package:tchilla/services/events/validator.dart';
import 'package:tchilla/viewmodel/detalhesproposedviewmodel.dart';

import 'package:tchilla/viewmodel/forgont_password_viewmodel.dart';
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
    Get.lazyPut<AppRoutes>(() => AppRoutes());
    registerEvents();
    registerViewmodels();
  }

  static void registerEvents() {
    Get.put(Navigation());
    Get.put(Notificator());
    Get.put(Validator());
  }

  static void registerViewmodels() {
    Get.lazyPut<SplashViewmodel>(
      () => SplashViewmodel(
        navigator: Get.find(),
        notificator: Get.find(),
      ),
    );
    Get.lazyPut<OnboardingViewModel>(
      () => OnboardingViewModel(
        navigator: Get.find(),
      ),
    );

    Get.lazyPut<WelcomeViewmodel>(
      () => WelcomeViewmodel(
        navigator: Get.find(),
      ),
    );

    Get.put<LoginViewmodel>(
      LoginViewmodel(
        navigator: Get.find(),
        notificator: Get.find(),
        validator: Get.find(),
      ),
    );
    Get.put<RegisterViewmodel>(
      RegisterViewmodel(
        navigator: Get.find(),
        notificator: Get.find(),
        validator: Get.find(),
      ),
    );
    Get.put<ForgontPasswordViewmodel>(
      ForgontPasswordViewmodel(
        navigator: Get.find(),
        notificator: Get.find(),
        validator: Get.find(),
      ),
    );
    Get.put<HomeViewModel>(
      HomeViewModel(
        navigator: Get.find(),
      ),
    );

    Get.put<DetalheProposedViewModel>(
      DetalheProposedViewModel(
        navigator: Get.find(),
      ),
    );
    Get.put<ViewMoreViewmodel>(
      ViewMoreViewmodel(
        navigator: Get.find(),
        notificator: Get.find(),
      ),
    );
    Get.put<ProfileViewmodel>(
      ProfileViewmodel(
        navigator: Get.find(),
        notificator: Get.find(),
      ),
    );
    Get.put<ResultSearchViewModel>(
      ResultSearchViewModel(
        navigator: Get.find(),
        notificator: Get.find(),
      ),
    );
  }
}
