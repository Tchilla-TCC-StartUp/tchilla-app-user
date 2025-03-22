import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchilla/resources/app_routes.dart';
import 'package:tchilla/view/pages/choose_payment_method_page.dart';
import 'package:tchilla/view/pages/detalhe_proposed_page.dart';
import 'package:tchilla/view/pages/forgot_passsword_auth_email_page.dart';
import 'package:tchilla/view/pages/forgot_password_confitmation_pin_page.dart';
import 'package:tchilla/view/pages/home_page.dart';
import 'package:tchilla/view/pages/login_page.dart';
import 'package:tchilla/view/pages/notifications_page.dart';
import 'package:tchilla/view/pages/onboarding_page.dart';
import 'package:tchilla/view/pages/profile_page.dart';
import 'package:tchilla/view/pages/redefine_password_page.dart';
import 'package:tchilla/view/pages/register_page.dart';
import 'package:tchilla/view/pages/result_search_page.dart';
import 'package:tchilla/view/pages/splash_page.dart';
import 'package:tchilla/view/pages/summary_page.dart';
import 'package:tchilla/view/pages/tiket_page.dart';
import 'package:tchilla/view/pages/user_data_page.dart';
import 'package:tchilla/view/pages/welcome_page.dart';

class AppGetAppRoutes {
  static final List<GetPage> routes = [
    _buildRoute(AppRoutes.initialRoute, (_) => const SplashPage()),
    _buildRoute(AppRoutes.homePage, (_) => const HomePage()),
    _buildRoute(AppRoutes.loginPage, (_) => const LoginPage()),
    _buildRoute(AppRoutes.registerPage, (_) => const RegisterPage()),
    _buildRoute(AppRoutes.forgotPasswordEmail,
        (_) => const ForgotPassswordAuthEmailPage()),
    _buildRoute(AppRoutes.forgotPasswordConfirmationPin,
        (_) => const ForgotPasswordConfirmationPinPage()),
    _buildRoute(AppRoutes.redefinePasswordPage,
        (args) => RedefinePasswordPage(previousWalk: args)),
    _buildRoute(AppRoutes.onboardingPage, (_) => const OnboardingPage()),
    _buildRoute(AppRoutes.resultSearchPage, (_) => const ResultSearchPage()),
    _buildRoute(AppRoutes.welcomePage, (_) => const WelcomePage()),
    _buildRoute(AppRoutes.detailsPage, (args) => DetalheProposedPage(id: args)),
    _buildRoute(AppRoutes.profilePage, (_) => const ProfilePage()),
    _buildRoute(AppRoutes.userdataPage, (args) => UserDataPage(id: args)),
    _buildRoute(AppRoutes.summaryPage, (args) => SummaryPage(id: args)),
    _buildRoute(AppRoutes.tiketPage, (args) => TiketPage(id: args)),
    _buildRoute(
        AppRoutes.chosePaymentPage, (args) => const ChoosePaymentMethodPage()),
    _buildRoute(
        AppRoutes.notificationPage, (args) => const NotificationsPage()),
  ];

  static GetPage _buildRoute(
    String path,
    Widget Function(dynamic args) pageBuilder,
  ) {
    return GetPage(
      name: path,
      page: () => pageBuilder(Get.arguments),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
