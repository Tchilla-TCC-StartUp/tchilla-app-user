import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tchilla/resources/app_routers.dart' as Router;
import 'package:tchilla/view/pages/detalhe_proposed_page.dart';
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
            _buildStaticRoute(
              name: Router.initialRoute,
              path: Router.initialRoute,
              page: const SplashPage(),
            ),
            _buildStaticRoute(
              name: Router.homePage,
              path: Router.homePage,
              page: const HomePage(),
            ),
            _buildStaticRoute(
              name: Router.loginPage,
              path: Router.loginPage,
              page: const LoginPage(),
            ),
            _buildStaticRoute(
              name: Router.registerPage,
              path: Router.registerPage,
              page: const RegisterPage(),
            ),
            _buildStaticRoute(
              name: Router.forengePassswordEmail,
              path: Router.forengePassswordEmail,
              page: const ForengePassswordAuthEmailPage(),
            ),
            _buildStaticRoute(
              name: Router.forengePassswordConfirmationPin,
              path: Router.forengePassswordConfirmationPin,
              page: const ForengePasswordConfirmationPinPage(),
            ),
            _buildStaticRoute(
              name: Router.redefinePasswordPage,
              path: Router.redefinePasswordPage,
              page: const RedefinePasswordPage(),
            ),
            _buildStaticRoute(
              name: Router.onboardingPage,
              path: Router.onboardingPage,
              page: const OnboardingPage(),
            ),
            _buildStaticRoute(
              name: Router.resultSearchPage,
              path: Router.resultSearchPage,
              page: const ResultSearchPage(),
            ),
            _buildStaticRoute(
              name: Router.welconePage,
              path: Router.welconePage,
              page: const WelcomePage(),
            ),
            _buildDynamicRoute<String>(
              name: Router.detalheshPage,
              path: Router.detalheshPage,
              pageBuilder: (context, id) => DetalheProposedPage(id: id),
            ),
          ],
        );

  static GoRoute _buildStaticRoute({
    required String name,
    required String path,
    required Widget page,
  }) {
    return GoRoute(
      name: name,
      path: path,
      builder: (context, state) => page,
      pageBuilder: (context, state) => _buildPageTransition(state, child: page),
    );
  }

  static GoRoute _buildDynamicRoute<T>({
    required String name,
    required String path,
    required Widget Function(BuildContext context, T extra) pageBuilder,
  }) {
    return GoRoute(
      name: name,
      path: path,
      builder: (context, state) {
        final extra = state.extra as T;
        return pageBuilder(context, extra);
      },
      pageBuilder: (context, state) {
        final extra = state.extra as T;
        return _buildPageTransition(state, child: pageBuilder(context, extra));
      },
    );
  }

  static Page<void> _buildPageTransition(GoRouterState state,
      {required Widget child}) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
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
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
