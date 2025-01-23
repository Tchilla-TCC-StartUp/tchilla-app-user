
import 'package:go_router/go_router.dart';
import 'package:tchilla/util/interface/inavigation.dart';
import 'package:tchilla/resources/app_routers.dart' as Router;

class Navigation extends INavigation {
  final GoRouter _router;

  Navigation(this._router);
  @override
  Future<void> navigateToHome() {
    return _router.pushReplacementNamed(
      Router.homePage,
    );
  }

  @override
  Future<void> navigateToLoginPage() {
    return _router.pushReplacementNamed(
      Router.loginPage,
    );
  }

  @override
  Future<void> navigateToRegisterPage() {
    return _router.pushReplacementNamed(
      Router.registerPage,
    );
  }

  @override
  navigateToBack() {
    _router.pop();
  }

  @override
  Future<void> navigateToForengePassewordEmailPage() {
    return _router.pushNamed(Router.forengePassswordEmail);
  }

  @override
  Future<void> navigateToConfirmationPage() {
    return _router.pushNamed(Router.forengePassswordConfirmationPin);
  }

  @override
  Future<void> navigateToRefefinePasswordPage() {
    return _router.pushNamed(Router.redefinePasswordPage);
  }

  @override
  Future<void> navigateToOnboarding() {
    return _router.pushReplacementNamed(Router.onboardingPage);
  }
}
