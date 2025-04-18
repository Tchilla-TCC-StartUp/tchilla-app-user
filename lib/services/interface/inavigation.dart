abstract class INavigation {
  navigateToHome();
  navigateToOnboarding();
  navigateToLoginPage();
  navigateToRegisterPage();
  navigateToBack();

  navigateToForengePassewordEmailPage();
  navigateToConfirmationPage();
  navigateToRefefinePasswordPage(String previousWalk);
  navigateToScheduleDetalhes(String previousWalk);
  navigateToResultSearchPage();
  navigateToWelcomePage();

  navigateToDetalhesPage(String id);
  navigateToProfilePage(String userNamer, String image);
  navigateToUserDataPage();
  navigateToSummaryPage(String id);
  navigateToTiketPage(String id);
  navigateToChoosePaymentPage();
  navigateToErrorPage(void Function() tryAgainEve);
  navigateToNotificationPage();
  navigateToSchedulesPage();
  navigateToSucessPage();
  navigateToPaymentReceipt();
  navigateToPaymentMCX();
}
