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
  navigateToProfilePage(String userNamer, String image) {
    Get.toNamed(AppRoutes.profilePage,
        arguments: {"userNamer": userNamer, "image": image});
  }

  @override
  navigateToUserDataPage() {
    Get.toNamed(AppRoutes.userdataPage);
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

  @override
  navigateToChoosePaymentPage() {
    Get.toNamed(AppRoutes.chosePaymentPage);
  }

  @override
  navigateToNotificationPage() {
    Get.toNamed(AppRoutes.notificationPage);
  }
}
