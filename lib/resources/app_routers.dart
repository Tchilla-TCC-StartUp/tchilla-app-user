//Mains Pages
final String initialRoute = "/";
final String mainRouter = "${initialRoute}main";

//Onboarding Pages
final String onboardingPage = "$mainRouter/onboarding";

//Home Pages
final String homePage = "$mainRouter/home";
final String resultSearchPage = "$homePage/result_search";

//Aurh Pages
final String loginPage = "$mainRouter/login";
final String registerPage = "$mainRouter/register";
final String forengePassswordEmail =
    "$mainRouter/forange_passsword/auth_email_page";
final String forengePassswordConfirmationPin =
    "$forengePassswordEmail/forange_passsword/confirmation_pin";

final String redefinePasswordPage =
    "$forengePassswordConfirmationPin/redefinePasswordPage";

//Welcone Pages
final String welconePage = "$mainRouter/welcome";
