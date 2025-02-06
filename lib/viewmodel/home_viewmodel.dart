import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/util/events/navigation.dart';

class HomeViewModel extends GetxController {
  final _navigator = Get.find<Navigation>();

  RxInt selectedIndex = 0.obs;
  RxDouble adptiveHeight = 420.px.obs;
  RxDouble adptiveSilverExpade = 650.px.obs;

  void selectTab(int index) {
    selectedIndex.value = index;
    updateAdaptiveHeight();
  }

  void selectProposed(String id) {
    _navigator.navigateToDetalhesPage(id);
  }

  navigateToResultSearchPage() {
    return _navigator.navigateToResultSearchPage();
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
