// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:tchilla/services/events/navigation.dart';

class OnboardingViewModel extends GetxController {
  final Navigation navigator;
  OnboardingViewModel({
    required this.navigator,
  });

  final pageController = PageController();
  final RxInt currentPage = 0.obs;

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
