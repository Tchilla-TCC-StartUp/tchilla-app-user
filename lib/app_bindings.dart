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
import 'package:tchilla/services/events/conectivity_service.dart';
import 'package:tchilla/services/events/home_service.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/services/events/notificator.dart';
import 'package:tchilla/services/events/onboarding_service.dart';
import 'package:tchilla/services/events/user_service.dart';
import 'package:tchilla/services/events/validator.dart';
import 'package:tchilla/services/events/welcome_service.dart';
import 'package:tchilla/viewmodel/event/choose_payment_method_viewmodel.dart';
import 'package:tchilla/viewmodel/event/detalhes_proposed_viewmodel.dart';
import 'package:tchilla/viewmodel/event/forgont_password_viewmodel.dart';
import 'package:tchilla/viewmodel/event/form_local_end_service_viewmodel.dart';
import 'package:tchilla/viewmodel/event/form_local_viewmodel.dart';
import 'package:tchilla/viewmodel/event/form_service_viewmodel.dart';
import 'package:tchilla/viewmodel/event/home_viewmodel.dart';
import 'package:tchilla/viewmodel/event/login_viewmodel.dart';
import 'package:tchilla/viewmodel/event/notification_viewmodel.dart';
import 'package:tchilla/viewmodel/event/onboarding_viewmodel.dart';
import 'package:tchilla/viewmodel/event/profile_viewmodel.dart';
import 'package:tchilla/viewmodel/event/register_viewmodel.dart';
import 'package:tchilla/viewmodel/event/result_search_viewmodel.dart';
import 'package:tchilla/viewmodel/event/schedule_detalhe_viewmodel.dart';
import 'package:tchilla/viewmodel/event/schedules_viewmodel.dart';
import 'package:tchilla/viewmodel/event/splash_viewmodel.dart';
import 'package:tchilla/viewmodel/event/summary_viewmodel.dart';
import 'package:tchilla/viewmodel/event/user_data_viewmodel.dart';
import 'package:tchilla/viewmodel/event/view_more_viewmodel.dart';
import 'package:tchilla/viewmodel/event/welcome_viewmodel.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    init();
  }

  static void init() {
    Get.put(AppConstats());
    localData();
    Get.put<AppRoutes>(AppRoutes());
    Get.put(Navigation());
    Get.put(Notificator());
    Get.put(Validator());
    Get.put(AppLogs());
    Get.put(AppDio().dio);
    registerRepositories();
    registerServices();
    registerViewmodels();
  }

// ---------- Registro de Dados Locais ----------
  static void localData() {
    Get.put(BaseLocalData());
    Get.put(LocalTokenData());
  }

  // ---------- Registro de Eventos ----------
  static void registerServices() {
    Get.lazyPut<ConectivityService>(() => ConectivityService(), fenix: true);
    Get.lazyPut<HomeService>(() => HomeService(), fenix: true);
    Get.lazyPut<UserService>(() => UserService(), fenix: true);
    Get.lazyPut<OnboardingService>(() => OnboardingService(), fenix: true);
    Get.lazyPut<WelcomeService>(() => WelcomeService(), fenix: true);
  }

// ---------- Registro de Repositórios ----------
  static void registerRepositories() {
    Get.lazyPut<OnboardingRepository>(() => OnboardingRepository(),
        fenix: true);
    Get.lazyPut<WelcomeRepository>(() => WelcomeRepository(), fenix: true);
    Get.lazyPut<UserRepository>(() => UserRepository(), fenix: true);
  }

// ---------- Registro de ViewModels ----------
  static void registerViewmodels() {
    Get.lazyPut<SplashViewmodel>(
      () => SplashViewmodel(conectivityService: Get.find()),
      fenix: true,
    );
    Get.lazyPut<OnboardingViewModel>(
      () => OnboardingViewModel(service: Get.find()),
      fenix: true,
    );
    Get.lazyPut<WelcomeViewmodel>(
      () => WelcomeViewmodel(service: Get.find()),
      fenix: true,
    );
    Get.lazyPut<LoginViewmodel>(
      () => LoginViewmodel(service: Get.find()),
      fenix: true,
    );
    Get.lazyPut<RegisterViewmodel>(
      () => RegisterViewmodel(service: Get.find()),
      fenix: true,
    );
    Get.lazyPut<ForgontPasswordViewmodel>(
      () => ForgontPasswordViewmodel(service: Get.find()),
      fenix: true,
    );
    Get.lazyPut<HomeViewModel>(
      () => HomeViewModel(service: Get.find()),
      fenix: true,
    );
    Get.lazyPut<DetalheProposedViewModel>(
      () => DetalheProposedViewModel(),
      fenix: true,
    );
    Get.lazyPut<ViewMoreViewmodel>(
      () => ViewMoreViewmodel(),
      fenix: true,
    );
    Get.lazyPut<ProfileViewmodel>(
      () => ProfileViewmodel(service: Get.find()),
      fenix: true,
    );
    Get.lazyPut<ResultSearchViewModel>(
      () => ResultSearchViewModel(),
      fenix: true,
    );
    Get.lazyPut<UserDataViewModel>(
      () => UserDataViewModel(service: Get.find()),
      fenix: true,
    );
    Get.lazyPut<SummaryViewmodel>(
      () => SummaryViewmodel(),
      fenix: true,
    );
    Get.lazyPut<FormLocalViewmodel>(
      () => FormLocalViewmodel(),
      fenix: true,
    );
    Get.lazyPut<FormServiceViewmodel>(
      () => FormServiceViewmodel(),
      fenix: true,
    );
    Get.lazyPut<FormLocalEndServiceViewmodel>(
      () => FormLocalEndServiceViewmodel(),
      fenix: true,
    );
    Get.lazyPut<NotificationViewmodel>(
      () => NotificationViewmodel(),
      fenix: true,
    );
    Get.lazyPut<ChoosePaymentMethodViewmodel>(
      () => ChoosePaymentMethodViewmodel(),
      fenix: true,
    );
    Get.lazyPut<SchedulesViewmodel>(
      () => SchedulesViewmodel(),
      fenix: true,
    );
    Get.lazyPut<ScheduleDetalheViewmodel>(
      () => ScheduleDetalheViewmodel(),
      fenix: true,
    );
  }
}
