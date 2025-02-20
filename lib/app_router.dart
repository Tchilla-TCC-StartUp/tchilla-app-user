import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchilla/resources/app_routes.dart';
import 'package:tchilla/view/pages/detalhe_proposed_page.dart';
import 'package:tchilla/view/pages/forenge_passsword_auth_email_page.dart';
import 'package:tchilla/view/pages/forenge_password_confitmation_pin_page.dart';
import 'package:tchilla/view/pages/home_page.dart';
import 'package:tchilla/view/pages/login_page.dart';
import 'package:tchilla/view/pages/onboarding_page.dart';
import 'package:tchilla/view/pages/profile_page.dart';
import 'package:tchilla/view/pages/redefine_password_page.dart';
import 'package:tchilla/view/pages/register_page.dart';
import 'package:tchilla/view/pages/result_search_page.dart';
import 'package:tchilla/view/pages/splash_page.dart';
import 'package:tchilla/view/pages/welcome_page.dart';

class AppGetAppRoutes {
  static final List<GetPage> routes = [
    _buildStaticRoute(
      AppRoutes.initialRoute,
      const SplashPage(),
    ),
    _buildStaticRoute(
      AppRoutes.homePage,
      const HomePage(),
    ),
    _buildStaticRoute(
      AppRoutes.loginPage,
      const LoginPage(),
    ),
    _buildStaticRoute(
      AppRoutes.registerPage,
      const RegisterPage(),
    ),
    _buildStaticRoute(
      AppRoutes.forgotPasswordEmail,
      const ForengePassswordAuthEmailPage(),
    ),
    _buildStaticRoute(
      AppRoutes.forgotPasswordConfirmationPin,
      const ForengePasswordConfirmationPinPage(),
    ),
    _buildStaticRoute(
        AppRoutes.redefinePasswordPage, const RedefinePasswordPage()),
    _buildStaticRoute(AppRoutes.onboardingPage, const OnboardingPage()),
    _buildStaticRoute(AppRoutes.resultSearchPage, const ResultSearchPage()),
    _buildStaticRoute(AppRoutes.welcomePage, const WelcomePage()),
    _buildDynamicRoute<String>(
        AppRoutes.detailsPage, (id) => DetalheProposedPage(id: id)),
    _buildDynamicRoute<String>(
        AppRoutes.profilePage, (id) => ProfilePage(id: id)),
  ];

  static GetPage _buildStaticRoute(String path, Widget page) {
    return GetPage(
      name: path,
      page: () => page,
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }

  static GetPage _buildDynamicRoute<T>(
      String path, Widget Function(T) pageBuilder) {
    return GetPage(
      name: path,
      page: () {
        final args = Get.arguments as T;
        return pageBuilder(args);
      },
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
