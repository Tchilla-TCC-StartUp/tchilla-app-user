import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tchilla/util/events/navigation.dart';

class OnboardingViewModel extends GetxController {
  final _navigator = Get.find<Navigation>();
  final pageController = PageController();
  final RxInt currentPage = 0.obs;

  void nextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    } else {
      _navigator.navigateToHome();
    }
  }

  void clickSkip() {
    _navigator.navigateToLoginPage();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
