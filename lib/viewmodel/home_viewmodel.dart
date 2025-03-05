import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  RxInt selectedIndex = 0.obs;
  RxDouble adptiveHeight = 510.px.obs;
  RxDouble adptiveSilverExpade = 780.px.obs;

  RxList<String> tabTitlesForm = ["Local", "Serviços", "Local+Serviços"].obs;



  void selectTab(int index) {
    selectedIndex.value = index;
    updateAdaptiveHeight();
  }

  void navigateToProfilePage() {
    this.navigator.navigateToProfilePage();
  }

  navigateToResultSearchPage() {
    return this.navigator.navigateToResultSearchPage();
  }

  Future<void> searchLocal(
      String local, DateTime data, int envitNumber, BuildContext context) {
    return this.navigator.navigateToResultSearchPage();
  }

  void updateAdaptiveHeight() {
    switch (selectedIndex.value) {
      case 0:
        adptiveHeight.value = 520.px;
        adptiveSilverExpade.value = 780.px;
        break;
      case 1:
        adptiveHeight.value = 625.px;
        adptiveSilverExpade.value = 880.px;
        break;
      case 2:
        adptiveHeight.value = 625.px;
        adptiveSilverExpade.value = 880.px;
        break;
      default:
        adptiveHeight.value = 520.px;
        adptiveSilverExpade.value = 780.px;
        break;
    }
  }
}
