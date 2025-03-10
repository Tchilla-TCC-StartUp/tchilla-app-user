import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  RxInt selectedIndex = 0.obs;
  RxDouble adptiveHeight = 510.px.obs;
  RxDouble adptiveSilverExpade = 780.px.obs;
  final RxBool isVisible = true.obs;

  RxList<String> tabTitlesForm = ["Local", "Serviços", "Local+Serviços"].obs;

  void selectTab(int index, FocusNode focusNode) {
    focusNode.unfocus();
    selectedIndex.value = index;
    updateAdaptiveHeight(focusNode);
  }

  void navigateToProfilePage() {
    this.navigator.navigateToProfilePage();
  }

  navigateToResultSearchPage() {
    return this.navigator.navigateToResultSearchPage();
  }

  Future<void> searchLocal(
    String local,
    DateTime data,
    int envitNumber,
    BuildContext context,
  ) {
    return this.navigator.navigateToResultSearchPage();
  }

  void onFocus(FocusNode focusNode) {
    var focus = isVisible.value = focusNode.hasFocus;
    adptiveHeight.value = focus ? 220.px : 520.px;
    adptiveSilverExpade.value = focus ? 480.px : 780.px;
  }

  void updateAdaptiveHeight(FocusNode focusNode) {
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
