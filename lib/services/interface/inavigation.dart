abstract class INavigation {
  navigateToHome();
  navigateToOnboarding();
  navigateToLoginPage();
  navigateToRegisterPage();
  navigateToBack();

  navigateToForengePassewordEmailPage();
  navigateToConfirmationPage();
  navigateToRefefinePasswordPage(String previousWalk);

  navigateToResultSearchPage();
  navigateToWelcomePage();

  navigateToDetalhesPage(String id);
  navigateToProfilePage();
  navigateToUserDataPage(String id);
  navigateToSummaryPage(String id);
  navigateToTiketPage(String id);
  navigateToChoosePaymentPage();
  navigateToErrorPage(void Function() tryAgainEve);
  navigateToNotificationPage();
}
