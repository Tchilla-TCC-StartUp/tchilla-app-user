import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tchilla/model/onboarding_model.dart';
import 'package:tchilla/repository/events/onboarding_repository.dart';
import 'package:tchilla/viewmodel/base_viewlmodel.dart';

class OnboardingViewModel extends BaseViewlmodel {
  final OnboardingRepository repository;
  OnboardingViewModel({
    required this.repository,
    required super.notificator,
    required super.validator,
    required super.navigator,
    required super.loger,
  });

  final pageController = PageController();
  final RxInt currentPage = 0.obs;

  final RxList<OnboardingModel> _onboarding = <OnboardingModel>[].obs;
  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;
  RxList<OnboardingModel> get onboarding => _onboarding;

  void getOnboarding(BuildContext context) async {
    try {
      _isLoading.value = true;
      final lang = Get.deviceLocale?.languageCode ?? "en";
      loger.info("Buscando dados do onboarding para o idioma: $lang");
      final List<OnboardingModel> data = await repository.fetchOnboadData(lang);
      loger.printJson(data);
      _onboarding.assignAll(data);
      loger.info("Dados do onboarding carregados com sucesso.");
    } catch (e, stacktrace) {
      handleError(context, e, stacktrace, );
    } finally {
      _isLoading.value = false;
    }
  }

  void nextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      this.navigator.navigateToWelcomePage();
    }
  }

  void clickSkip() {
    this.navigator.navigateToWelcomePage();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
