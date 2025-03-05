import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tchilla/model/onboarding_model.dart';
import 'package:tchilla/repository/events/onboarding_repository.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

class OnboardingViewModel extends BaseViewModel {
  final OnboardingRepository repository;

  OnboardingViewModel({
    required this.repository,
  });

  final pageController = PageController();
  final RxInt currentPage = 0.obs;
  final RxList<OnboardingModel> _onboarding = <OnboardingModel>[].obs;

  RxList<OnboardingModel> get onboarding => _onboarding;

  void getOnboarding() async {
    await request(
      event: repository.fetchOnboadData(lang),
      onSuccess: (value) {
        _onboarding.assignAll(value);
      },
    );
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
