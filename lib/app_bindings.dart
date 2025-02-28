import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tchilla/repository/events/onboarding_repository.dart';
import 'package:tchilla/repository/events/welcome_repository.dart';
import 'package:tchilla/resources/app_constats.dart';
import 'package:tchilla/resources/app_logs.dart';
import 'package:tchilla/resources/app_routes.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/services/events/notificator.dart';
import 'package:tchilla/services/events/validator.dart';
import 'package:tchilla/viewmodel/detalhesproposedviewmodel.dart';
import 'package:tchilla/viewmodel/forgont_password_viewmodel.dart';
import 'package:tchilla/viewmodel/home_viewmodel.dart';
import 'package:tchilla/viewmodel/login_viewmodel.dart';
import 'package:tchilla/viewmodel/onboarding_viewmodel.dart';
import 'package:tchilla/viewmodel/profile_viewmodel.dart';
import 'package:tchilla/viewmodel/register_viewmodel.dart';
import 'package:tchilla/viewmodel/result_search_viewmodel.dart';
import 'package:tchilla/viewmodel/splash_viewmodel.dart';
import 'package:tchilla/viewmodel/summary_viewmodel.dart';
import 'package:tchilla/viewmodel/user_data_viewmodel.dart';
import 'package:tchilla/viewmodel/view_more_viewmodel.dart';
import 'package:tchilla/viewmodel/welcome_viewmodel.dart';
import 'package:tchilla/resources/ app_interceptor.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    init();
  }

  static void init() {
    registerEvents();
    // ---------- Configuração do Dio ----------
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstats.baseUrl,
        sendTimeout: const Duration(minutes: 1),
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
      ),
    )..interceptors.add(
        AppInterceptor(logger: Get.find()),
      );

    // ---------- Registrações ----------
    Get.lazyPut<AppRoutes>(() => AppRoutes());

    registerRepositories(dio);
    registerViewmodels();
  }

  // ---------- Registro de Eventos ----------
  static void registerEvents() {
    Get.put(Navigation());
    Get.put(Notificator());
    Get.put(Validator());
    Get.put(AppLogs());
  }

  // ---------- Registro de Repositórios ----------
  static void registerRepositories(Dio dio) {
    Get.lazyPut<OnboardingRepository>(() => OnboardingRepository(
          dio: dio,
          navigator: Get.find(),
          notificator: Get.find(),
        ));
    Get.lazyPut<WelcomeRepository>(() => WelcomeRepository(
          dio: dio,
          navigator: Get.find(),
          notificator: Get.find(),
        ));
  }

  // ---------- Registro de ViewModels ----------
  static void registerViewmodels() {
    Get.lazyPut<SplashViewmodel>(() => SplashViewmodel(
          navigator: Get.find(),
          notificator: Get.find(),
          loger: Get.find(),
          validator: Get.find(),
        ));

    Get.lazyPut<OnboardingViewModel>(() => OnboardingViewModel(
          navigator: Get.find(),
          loger: Get.find(),
          repository: Get.find(),
          notificator: Get.find(),
          validator: Get.find(),
        ));

    Get.put<WelcomeViewmodel>(WelcomeViewmodel(
      navigator: Get.find(),
      loger: Get.find(),
      repository: Get.find(),
      notificator: Get.find(),
      validator: Get.find(),
    ));

    Get.put<LoginViewmodel>(LoginViewmodel(
      navigator: Get.find(),
      loger: Get.find(),
      notificator: Get.find(),
      validator: Get.find(),
    ));

    Get.put<RegisterViewmodel>(RegisterViewmodel(
      navigator: Get.find(),
      notificator: Get.find(),
      loger: Get.find(),
      validator: Get.find(),
    ));

    Get.put<ForgontPasswordViewmodel>(ForgontPasswordViewmodel(
      navigator: Get.find(),
      loger: Get.find(),
      notificator: Get.find(),
      validator: Get.find(),
    ));

    Get.put<HomeViewModel>(HomeViewModel(
      loger: Get.find(),
      navigator: Get.find(),
      notificator: Get.find(),
      validator: Get.find(),
    ));

    Get.put<DetalheProposedViewModel>(DetalheProposedViewModel(
      navigator: Get.find(),
      notificator: Get.find(),
      loger: Get.find(),
      validator: Get.find(),
    ));

    Get.put<ViewMoreViewmodel>(ViewMoreViewmodel(
      navigator: Get.find(),
      loger: Get.find(),
      notificator: Get.find(),
      validator: Get.find(),
    ));

    Get.put<ProfileViewmodel>(ProfileViewmodel(
      navigator: Get.find(),
      loger: Get.find(),
      notificator: Get.find(),
      validator: Get.find(),
    ));

    Get.put<ResultSearchViewModel>(ResultSearchViewModel(
      navigator: Get.find(),
      loger: Get.find(),
      notificator: Get.find(),
      validator: Get.find(),
    ));

    Get.put<UserDataViewModel>(UserDataViewModel(
      navigator: Get.find(),
      loger: Get.find(),
      notificator: Get.find(),
      validator: Get.find(),
    ));

    Get.put<SummaryViewmodel>(SummaryViewmodel(
      navigator: Get.find(),
      loger: Get.find(),
      notificator: Get.find(),
      validator: Get.find(),
    ));
  }
}
