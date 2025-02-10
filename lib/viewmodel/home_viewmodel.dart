import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:tchilla/util/events/navigation.dart';

class HomeViewModel extends GetxController {
  final Navigation navigator;
  RxInt selectedIndex = 0.obs;
  RxDouble adptiveHeight = 520.px.obs;
  RxDouble adptiveSilverExpade = 760.px.obs;

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
        adptiveHeight.value = 520.px;
        adptiveSilverExpade.value = 760.px;
        break;
      case 1:
        adptiveHeight.value = 625.px;
        adptiveSilverExpade.value = 860.px;
        break;
      case 2:
        adptiveHeight.value = 635.px;
        adptiveSilverExpade.value = 875.px;
        break;
      default:
        adptiveHeight.value = 520.px;
        adptiveSilverExpade.value = 760.px;
        break;
    }
  }
}
