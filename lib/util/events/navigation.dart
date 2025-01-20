import 'package:flutter_modular/flutter_modular.dart';
import 'package:tchilla/util/interface/inavigation.dart';
import 'package:tchilla/resources/app_routers.dart' as Router;

class Navigation extends INavigation {
  final modular = Modular;
  @override
  Future<void> navigateToHome() {
    return modular.to.pushNamedAndRemoveUntil(
      Router.homePage,
      (route) => false,
    );
  }

  @override
  Future<void> navigateToLoginPage() {
    return modular.to.pushNamedAndRemoveUntil(
      Router.loginPage,
      (route) => false,
    );
  }

  @override
  Future<void> navigateToRegisterPage() {
    return modular.to.pushNamedAndRemoveUntil(
      Router.registerPage,
      (route) => false,
    );
  }

  @override
  navigateToBack() {
    modular.to.pop();
  }

  @override
  Future<void> navigateToForengePassewordEmailPage() {
    return modular.to.pushNamed(Router.forengePassswordEmail);
  }

  @override
  Future<void> navigateToConfirmationPage() {
    return modular.to.pushNamed(Router.forengePassswordConfirmationPin);
  }

  @override
  Future<void> navigateToRefefinePasswordPage() {
    return modular.to.pushNamed(Router.redefinePasswordPage);
  }
}
