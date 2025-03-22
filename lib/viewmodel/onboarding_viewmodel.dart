// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:tchilla/model/onboarding_model.dart';
import 'package:tchilla/services/events/onboarding_service.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

class OnboardingViewModel extends BaseViewModel {
  final OnboardingService service;
  OnboardingViewModel({
    required this.service,
  });

  final pageController = PageController();
  final RxInt currentPage = 0.obs;
  final RxList<OnboardingModel> _onboarding = <OnboardingModel>[].obs;

  RxList<OnboardingModel> get onboarding => _onboarding;

  void getOnboarding() async {
    await onRequest(
      event: service.fetchOnboadData(lang),
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
