class AppRoutes {
  // Rota inicial
  static const String _initialRoute = "/";
  static const String _mainRouter = "${_initialRoute}main";

  // Onboarding Pages
  static const String _onboardingPage = "$_mainRouter/onboarding";
  static const String _errorPage = "$_mainRouter/error";

  // Home Pages
  static const String _homePage = "$_mainRouter/home";
  static const String _profilePage = "$_mainRouter/profile";
  static const String _resultSearchPage = "$_homePage/result_search";
  static const String _detailsPage = "$_resultSearchPage/detalhes";
  static const String _userdataPage = "$_profilePage/user_data";
  static const String _summaryPage = "$_detailsPage/summary";

  // Auth Pages
  static const String _loginPage = "$_mainRouter/login";
  static const String _registerPage = "$_mainRouter/register";
  static const String _forgotPasswordEmail = "$_mainRouter/forgotd/auth_email";
  static const String _forgotPasswordConfirmationPin =
      "$_forgotPasswordEmail/confirmation_pin";
  static const String _redefinePasswordPage =
      "$_forgotPasswordConfirmationPin/redefine_password";

  // Welcome Pages
  static const String _welcomePage = "$_mainRouter/welcome";

  // Getters públicos para acesso às rotas
  static String get initialRoute => _initialRoute;
  static String get mainRouter => _mainRouter;

  static String get onboardingPage => _onboardingPage;

  static String get homePage => _homePage;
  static String get profilePage => _profilePage;
  static String get resultSearchPage => _resultSearchPage;
  static String get detailsPage => _detailsPage;

  static String get loginPage => _loginPage;
  static String get registerPage => _registerPage;
  static String get forgotPasswordEmail => _forgotPasswordEmail;
  static String get forgotPasswordConfirmationPin =>
      _forgotPasswordConfirmationPin;
  static String get redefinePasswordPage => _redefinePasswordPage;

  static String get welcomePage => _welcomePage;

  static String get userdataPage => _userdataPage;
  static String get summaryPage => _summaryPage;
  static String get errorPage => _errorPage;
}
