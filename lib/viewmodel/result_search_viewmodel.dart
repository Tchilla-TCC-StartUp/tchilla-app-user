import 'package:get/get.dart';
import 'package:tchilla/util/events/navigation.dart';

class ResultSearchViewModel extends GetxController {
  final _navigator = Get.find<Navigation>();
  RxInt selectedIndex = 0.obs;

  void selectTab(int index) {
    selectedIndex.value = index;
  }

  selectProposed(String id) {
    _navigator.navigateToDetalhesPage(id);
  }
}
