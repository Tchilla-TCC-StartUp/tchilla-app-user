import 'package:get/get.dart';

import 'package:tchilla/resources/app_routes.dart';
import 'package:tchilla/services/interface/inavigation.dart';

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
  navigateToRefefinePasswordPage(String previousWalk) {
    Get.toNamed(AppRoutes.redefinePasswordPage, arguments: previousWalk);
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
  navigateToProfilePage() {
    Get.toNamed(AppRoutes.profilePage);
  }

  @override
  navigateToUserDataPage(String id) {
    Get.toNamed(AppRoutes.userdataPage, arguments: id);
  }

  @override
  navigateToSummaryPage(String id) {
    Get.toNamed(AppRoutes.summaryPage, arguments: id);
  }

  @override
  navigateToErrorPage(void Function() tryAgainEvet) {
    Get.toNamed(AppRoutes.errorPage, arguments: tryAgainEvet);
  }

  @override
  navigateToTiketPage(String id) {
    Get.toNamed(AppRoutes.tiketPage, arguments: id);
  }
}
