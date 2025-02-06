import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:tchilla/util/events/navigation.dart';

class HomeViewModel extends GetxController {
  final Navigation navigator;
  RxInt selectedIndex = 0.obs;
  RxDouble adptiveHeight = 420.px.obs;
  RxDouble adptiveSilverExpade = 650.px.obs;

  HomeViewModel({
    required this.navigator,
  });

  void selectTab(int index) {
    selectedIndex.value = index;
    updateAdaptiveHeight();
  }

  void navigateToProfilePage(String id) {
    navigator.navigateToProfilePage(id);
  }

  navigateToResultSearchPage() {
    return navigator.navigateToResultSearchPage();
  }

  Future<void> searchLocal(
      String local, DateTime data, int envitNumber, BuildContext context) {
    return navigator.navigateToResultSearchPage();
  }

  void updateAdaptiveHeight() {
    switch (selectedIndex.value) {
      case 0:
        adptiveHeight.value = 420.px;
        adptiveSilverExpade.value = 650.px;
        break;
      case 1:
        adptiveHeight.value = 500.px;
        adptiveSilverExpade.value = 730.px;
        break;
      case 2:
        adptiveHeight.value = 530.px;
        adptiveSilverExpade.value = 760.px;
        break;
      default:
        adptiveHeight.value = 420.px;
        adptiveSilverExpade.value = 650.px;
        break;
    }
  }
}
