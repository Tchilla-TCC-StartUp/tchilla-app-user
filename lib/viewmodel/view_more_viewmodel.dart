import 'package:get/get.dart';
import 'package:tchilla/util/events/navigation.dart';
import 'package:tchilla/util/events/notificator.dart';

class ViewMoreViewmodel extends GetxController {
  final Navigation navigator;
  final Notificator notificator;

  RxInt selectedIndex = 0.obs;

  ViewMoreViewmodel({required this.navigator, required this.notificator});

  void selectTab(int index) {
    selectedIndex.value = index;
  }

  void selectProposed(String id) {
    navigator.navigateToDetalhesPage(id);
  }

  navigateToResultSearchPage() {
    return navigator.navigateToResultSearchPage();
  }
}
