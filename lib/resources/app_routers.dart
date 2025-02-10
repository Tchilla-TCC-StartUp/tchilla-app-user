//Mains Pages
const String initialRoute = "/";
const String mainRouter = "${initialRoute}main";

//Onboarding Pages
const String onboardingPage = "$mainRouter/onboarding";

//Home Pages
const String homePage = "$mainRouter/home";
const String profilPage = "$mainRouter/profile";

const String resultSearchPage = "$homePage/result_search";
const String detalheshPage = "$resultSearchPage/detalhes";

//Aurh Pages
const String loginPage = "$mainRouter/login";
const String registerPage = "$mainRouter/register";
const String forengePassswordEmail =
    "$mainRouter/forange_passsword/auth_email_page";
const String forengePassswordConfirmationPin =
    "$forengePassswordEmail/forange_passsword/confirmation_pin";

const String redefinePasswordPage =
    "$forengePassswordConfirmationPin/redefinePasswordPage";

//Welcone Pages
const String welconePage = "$mainRouter/welcome";
