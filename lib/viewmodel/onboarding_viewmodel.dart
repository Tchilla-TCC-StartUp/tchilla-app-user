import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tchilla/model/onboarding_model.dart';
import 'package:tchilla/repository/events/onboarding_repository.dart';
import 'package:tchilla/resources/app_logs.dart';

import 'package:tchilla/services/events/navigation.dart';

class OnboardingViewModel extends GetxController {
  final Navigation navigator;
  final OnboardingRepository repository;
  final AppLogs logs;
  OnboardingViewModel({
    required this.navigator,
    required this.repository,
    required this.logs,
  });

  final pageController = PageController();
  final RxInt currentPage = 0.obs;
  final RxList<OnboardingModel> _onboarding = <OnboardingModel>[].obs;
  RxList<OnboardingModel> get onboarding => _onboarding;

  void getOnboarding() async {
    try {
      final lang = Get.deviceLocale?.languageCode ?? "en";
      logs.info("Buscando dados do onboarding para o idioma: $lang");
      final List<OnboardingModel> data = await repository.fetchOnboadData(lang);
      _onboarding.assignAll(data);
      logs.info("Dados do onboarding carregados com sucesso.");
    } catch (e, stacktrace) {
      logs.error(
        "Erro ao buscar dados do onboarding: ${e.toString()}",
        stacktrace,
      );
    }
  }

  void nextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      navigator.navigateToWelcomePage();
    }
  }

  void clickSkip() {
    navigator.navigateToWelcomePage();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
