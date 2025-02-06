import 'package:go_router/go_router.dart';
import 'package:tchilla/util/interface/inavigation.dart';
import 'package:tchilla/resources/app_routers.dart' as Router;

class Navigation extends INavigation {
  final GoRouter _router;

  Navigation(this._router);
  @override
  navigateToHome() {
    _router.goNamed(
      Router.homePage,
    );
  }

  @override
  navigateToLoginPage() {
    _router.pushReplacementNamed(
      Router.loginPage,
    );
  }

  @override
  navigateToRegisterPage() {
    _router.pushReplacementNamed(
      Router.registerPage,
    );
  }

  @override
  navigateToBack() {
    _router.pop();
  }

  @override
  navigateToForengePassewordEmailPage() {
    _router.pushNamed(Router.forengePassswordEmail);
  }

  @override
  navigateToConfirmationPage() {
    _router.pushNamed(Router.forengePassswordConfirmationPin);
  }

  @override
  navigateToRefefinePasswordPage() {
    _router.pushNamed(Router.redefinePasswordPage);
  }

  @override
  navigateToOnboarding() {
    _router.pushReplacementNamed(Router.onboardingPage);
  }

  @override
  navigateToResultSearchPage() {
    _router.pushNamed(Router.resultSearchPage);
  }

  @override
  navigateToWelcomePage() {
    _router.goNamed(Router.welconePage);
  }

  @override
  navigateToDetalhesPage(String id) {
    _router.pushNamed(Router.detalheshPage, extra: id);
  }

  @override
  navigateToProfilePage(String id) {
    _router.pushNamed(Router.profilPage, extra: id);
  }
}
