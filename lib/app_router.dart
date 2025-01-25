import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tchilla/resources/app_routers.dart' as Router;
import 'package:tchilla/view/pages/forenge_passsword_auth_email_page.dart';
import 'package:tchilla/view/pages/forenge_password_confitmation_pin_page.dart';
import 'package:tchilla/view/pages/home_page.dart';
import 'package:tchilla/view/pages/login_page.dart';
import 'package:tchilla/view/pages/onboarding_page.dart';
import 'package:tchilla/view/pages/redefine_password_page.dart';
import 'package:tchilla/view/pages/register_page.dart';
import 'package:tchilla/view/pages/result_search_page.dart';
import 'package:tchilla/view/pages/splash_page.dart';
import 'package:tchilla/view/pages/welcome_page.dart';

class AppRouter {
  final GoRouter router;

  AppRouter()
      : router = GoRouter(
          initialLocation: Router.initialRoute,
          routes: [
            _buildRoute(
              name: Router.initialRoute,
              path: Router.initialRoute,
              page: const SplashPage(),
            ),
            _buildRoute(
              name: Router.homePage,
              path: Router.homePage,
              page: const HomePage(),
            ),
            _buildRoute(
              name: Router.loginPage,
              path: Router.loginPage,
              page: const LoginPage(),
            ),
            _buildRoute(
              name: Router.registerPage,
              path: Router.registerPage,
              page: const RegisterPage(),
            ),
            _buildRoute(
              name: Router.forengePassswordEmail,
              path: Router.forengePassswordEmail,
              page: const ForengePassswordAuthEmailPage(),
            ),
            _buildRoute(
              name: Router.forengePassswordConfirmationPin,
              path: Router.forengePassswordConfirmationPin,
              page: const ForengePasswordConfirmationPinPage(),
            ),
            _buildRoute(
              name: Router.redefinePasswordPage,
              path: Router.redefinePasswordPage,
              page: const RedefinePasswordPage(),
            ),
            _buildRoute(
              name: Router.onboardingPage,
              path: Router.onboardingPage,
              page: const OnboardingPage(),
            ),
            _buildRoute(
              name: Router.resultSearchPage,
              path: Router.resultSearchPage,
              page: const ResultSearchPage(),
            ),
              _buildRoute(
              name: Router.welconePage,
              path: Router.welconePage,
              page: const  WelcomePage(),
            ),
          ],
        );

  static GoRoute _buildRoute({
    required String name,
    required String path,
    required Widget page,
  }) {
    return GoRoute(
      name: name,
      path: path,
      builder: (context, state) {
        return page;
      },
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            final tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            final offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 300),
        );
      },
    );
  }
}
