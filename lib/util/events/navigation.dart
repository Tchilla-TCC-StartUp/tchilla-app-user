import 'package:get/get.dart';

import 'package:tchilla/util/interface/inavigation.dart';
import 'package:tchilla/resources/app_routes.dart';

class Navigation extends INavigation {
  @override
  navigateToHome() {
    Get.offAllNamed(
      AppRoutes.homePage,
    );
  }

  @override
  navigateToLoginPage() {
    Get.offNamed(
      AppRoutes.loginPage,
    );
  }

  @override
  navigateToRegisterPage() {
    Get.offNamed(
      AppRoutes.registerPage,
    );
  }

  @override
  navigateToBack() {
    Get.back();
  }

  @override
  navigateToForengePassewordEmailPage() {
    Get.toNamed(AppRoutes.forgotPasswordEmail);
  }

  @override
  navigateToConfirmationPage() {
    Get.toNamed(AppRoutes.forgotPasswordConfirmationPin);
  }

  @override
  navigateToRefefinePasswordPage() {
    Get.toNamed(AppRoutes.redefinePasswordPage);
  }

  @override
  navigateToOnboarding() {
    Get.offNamed(AppRoutes.onboardingPage);
  }

  @override
  navigateToResultSearchPage() {
    Get.toNamed(AppRoutes.resultSearchPage);
  }

  @override
  navigateToWelcomePage() {
    Get.offAllNamed(AppRoutes.welcomePage);
  }

  @override
  navigateToDetalhesPage(String id) {
    Get.toNamed(AppRoutes.detailsPage, arguments: id);
  }

  @override
  navigateToProfilePage(String id) {
    Get.toNamed(AppRoutes.profilePage, arguments: id);
  }
}
