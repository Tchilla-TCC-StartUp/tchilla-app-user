import 'package:get/get.dart';
import 'package:tchilla/data/base_local_data.dart';
import 'package:tchilla/data/event/local_token_data.dart';
import 'package:tchilla/repository/events/onboarding_repository.dart';
import 'package:tchilla/repository/events/user_repository.dart';
import 'package:tchilla/repository/events/welcome_repository.dart';
import 'package:tchilla/resources/app_constats.dart';
import 'package:tchilla/resources/app_dio.dart';
import 'package:tchilla/resources/app_logs.dart';
import 'package:tchilla/resources/app_routes.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/services/events/notificator.dart';
import 'package:tchilla/services/events/validator.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';
import 'package:tchilla/viewmodel/detalhesproposedviewmodel.dart';
import 'package:tchilla/viewmodel/forgont_password_viewmodel.dart';
import 'package:tchilla/viewmodel/form_local_end_service_viewmodel.dart';
import 'package:tchilla/viewmodel/form_local_viewmodel.dart';
import 'package:tchilla/viewmodel/form_service_viewmodel.dart';
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

class AppBindings implements Bindings {
  @override
  void dependencies() {
    init();
  }

  static void init() {
    registerServices();
    localData();
    registerRepositories();
    registerViewmodels();
  }

  // ---------- Registro de Eventos ----------
  static void registerServices() {
    Get.put(AppConstats());
    Get.put<AppRoutes>(AppRoutes());
    Get.put(Navigation());
    Get.put(Notificator());
    Get.put(Validator());
    Get.put(AppLogs());
    Get.put(AppDio().dio);
  }

  // ---------- Registro de Dados Locais ----------
  static void localData() {
    Get.put(BaseLocalData());
    Get.put(LocalTokenData());
  }

  // ---------- Registro de Repositórios ----------
  static void registerRepositories() {
    Get.lazyPut<OnboardingRepository>(() => OnboardingRepository());
    Get.lazyPut<WelcomeRepository>(() => WelcomeRepository());

    Get.lazyPut<UserRepository>(() => UserRepository());
  }

  // ---------- Registro de ViewModels ----------
  static void registerViewmodels() {
    Get.put<BaseViewModel>(BaseViewModel());
    Get.put<SplashViewmodel>(SplashViewmodel());

    Get.put<OnboardingViewModel>(OnboardingViewModel(repository: Get.find()));

    Get.put<WelcomeViewmodel>(WelcomeViewmodel(
      repository: Get.find(),
    ));

    Get.put<LoginViewmodel>(LoginViewmodel(repository: Get.find()));

    Get.put<RegisterViewmodel>(RegisterViewmodel(repository: Get.find()));

    Get.put<ForgontPasswordViewmodel>(ForgontPasswordViewmodel());

    Get.put<HomeViewModel>(HomeViewModel());

    Get.put<DetalheProposedViewModel>(DetalheProposedViewModel());

    Get.put<ViewMoreViewmodel>(ViewMoreViewmodel());

    Get.put<ProfileViewmodel>(ProfileViewmodel());

    Get.put<ResultSearchViewModel>(ResultSearchViewModel());

    Get.put<UserDataViewModel>(UserDataViewModel());

    Get.put<SummaryViewmodel>(SummaryViewmodel());

    Get.put<FormLocalViewmodel>(FormLocalViewmodel());

    Get.put<FormServiceViewmodel>(FormServiceViewmodel());
    
    Get.put<FormLocalEndServiceViewmodel>(FormLocalEndServiceViewmodel());
  }
}
