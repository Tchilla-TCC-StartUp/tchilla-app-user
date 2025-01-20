import 'package:flutter_modular/flutter_modular.dart';
import 'package:tchilla/resources/app_routers.dart' as Router;
import 'package:tchilla/util/events/navigation.dart';
import 'package:tchilla/view/pages/forenge_passsword_auth_email_page.dart';
import 'package:tchilla/view/pages/forenge_password_confitmation_pin_page.dart';
import 'package:tchilla/view/pages/home_page.dart';
import 'package:tchilla/view/pages/login_page.dart';
import 'package:tchilla/view/pages/register_page.dart';
import 'package:tchilla/view/pages/splash_page.dart';
import 'package:tchilla/viewmodel/forenge_password_viewmodel.dart';
import 'package:tchilla/viewmodel/login_viewmodel.dart';
import 'package:tchilla/viewmodel/register_viewmodel.dart';
import 'package:tchilla/viewmodel/splash_viewmodel.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      Router.initialRoute,
      child: (context) => const SplashPage(),
      transition: TransitionType.rightToLeft,
    );
    r.child(
      Router.homePage,
      child: (context) => const HomePage(),
      transition: TransitionType.rightToLeft,
    );
    r.child(
      Router.loginPage,
      child: (context) => const LoginPage(),
      transition: TransitionType.rightToLeft,
    );
    r.child(
      Router.registerPage,
      child: (context) => const RegisterPage(),
      transition: TransitionType.rightToLeft,
    );
    r.child(
      Router.forengePassswordEmail,
      child: (context) => const ForengePassswordAuthEmailPage(),
      transition: TransitionType.rightToLeft,
    );
    r.child(
      Router.forengePassswordConfirmationPin,
      child: (context) => const ForengePasswordConfitmationPinPage(),
      transition: TransitionType.rightToLeft,
    );
  }
  @override
  void binds(Injector i) {
    // Navigation
    i.addLazySingleton<Navigation>(Navigation.new);
    // Viewmodels
    i.addLazySingleton<SplashViewmodel>(SplashViewmodel.new);
    i.addLazySingleton<LoginViewmodel>(LoginViewmodel.new);
    i.addLazySingleton<RegisterViewmodel>(RegisterViewmodel.new);
    i.addLazySingleton<ForengePasswordViewmodel>(ForengePasswordViewmodel.new);
  }
}
