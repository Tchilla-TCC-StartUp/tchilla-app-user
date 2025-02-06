import 'package:get/get.dart';
import 'package:tchilla/util/events/navigation.dart';

class ViewMoreViewmodel extends GetxController {
  final _navigation = Get.find<Navigation>();

  RxInt selectedIndex = 0.obs;

  void selectTab(int index) {
    selectedIndex.value = index;
  }

  void selectProposed(String id) {
    _navigation.navigateToDetalhesPage(id);
  }

  navigateToResultSearchPage() {
    return _navigation.navigateToResultSearchPage();
  }
}
