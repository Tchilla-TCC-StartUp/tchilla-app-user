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
import 'package:tchilla/view/pages/receipt_method_page.dart';
import 'package:tchilla/view/pages/redefine_password_page.dart';
import 'package:tchilla/view/pages/register_page.dart';
import 'package:tchilla/view/pages/result_search_page.dart';
import 'package:tchilla/view/pages/schedules_page.dart';
import 'package:tchilla/view/pages/splash_page.dart';
import 'package:tchilla/view/pages/sucess_schedule_page.dart';
import 'package:tchilla/view/pages/summary_page.dart';
import 'package:tchilla/view/pages/tiket_page.dart';
import 'package:tchilla/view/pages/user_data_page.dart';
import 'package:tchilla/view/pages/welcome_page.dart';
import 'package:tchilla/view/widgets/schedules_detalhe.dart';

class AppGetAppRoutes {
  static final List<GetPage> routes = [
    _buildRoute(
      path: AppRoutes.initialRoute,
      pageBuilder: (_) => const SplashPage(),
    ),
    _buildRoute(
      path: AppRoutes.homePage,
      pageBuilder: (_) => const HomePage(),
    ),
    _buildRoute(
      path: AppRoutes.loginPage,
      pageBuilder: (_) => const LoginPage(),
    ),
    _buildRoute(
      path: AppRoutes.registerPage,
      pageBuilder: (_) => const RegisterPage(),
    ),
    _buildRoute(
      path: AppRoutes.schedulesPage,
      pageBuilder: (_) => const SchedulesPage(),
    ),
    _buildRoute(
      path: AppRoutes.forgotPasswordEmail,
      pageBuilder: (_) => const ForgotPassswordAuthEmailPage(),
    ),
    _buildRoute(
      path: AppRoutes.forgotPasswordConfirmationPin,
      pageBuilder: (_) => const ForgotPasswordConfirmationPinPage(),
    ),
    _buildRoute(
      path: AppRoutes.redefinePasswordPage,
      pageBuilder: (args) => RedefinePasswordPage(previousWalk: args),
    ),
    _buildRoute(
      path: AppRoutes.onboardingPage,
      pageBuilder: (_) => const OnboardingPage(),
    ),
    _buildRoute(
      path: AppRoutes.resultSearchPage,
      pageBuilder: (_) => const ResultSearchPage(),
    ),
    _buildRoute(
      path: AppRoutes.welcomePage,
      pageBuilder: (_) => const WelcomePage(),
    ),
    _buildRoute(
      path: AppRoutes.detailsPage,
      pageBuilder: (args) => DetalheProposedPage(id: args),
    ),
    _buildRoute(
      path: AppRoutes.profilePage,
      pageBuilder: (args) => ProfilePage(userNamer: args['userNamer']),
    ),
    _buildRoute(
      path: AppRoutes.userdataPage,
      pageBuilder: (args) => const UserDataPage(),
    ),
    _buildRoute(
      path: AppRoutes.summaryPage,
      pageBuilder: (args) => SummaryPage(id: args),
    ),
    _buildRoute(
      path: AppRoutes.tiketPage,
      pageBuilder: (args) => TiketPage(id: args),
    ),
    _buildRoute(
      path: AppRoutes.chosePaymentPage,
      pageBuilder: (args) => const ChoosePaymentMethodPage(),
    ),
    _buildRoute(
      path: AppRoutes.notificationPage,
      pageBuilder: (args) => const NotificationsPage(),
    ),
    _buildRoute(
      path: AppRoutes.sucessSchedulesPage,
      pageBuilder: (args) => const SucessSchedulePage(),
    ),
    _buildRoute(
      path: AppRoutes.receiptPaymentPage,
      pageBuilder: (args) => const ReceiptMethodPage(),
    ),
    _buildRoute(
      path: AppRoutes.schedulesDetalhes,
      pageBuilder: (args) => SchedulesDetalhePage(
        previousWalk: args,
      ),
    ),
  ];

  static GetPage _buildRoute({
    required String path,
    Transition? transition,
    required Widget Function(dynamic args) pageBuilder,
  }) {
    return GetPage(
      name: path,
      page: () => pageBuilder(Get.arguments),
      transition: transition ?? Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
