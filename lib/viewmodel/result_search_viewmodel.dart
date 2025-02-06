import 'package:get/get.dart';
import 'package:tchilla/util/events/navigation.dart';
import 'package:tchilla/util/events/notificator.dart';

class ResultSearchViewModel extends GetxController {
  final Navigation navigator;
  final Notificator notificator;

  RxInt selectedIndex = 0.obs;

  ResultSearchViewModel({
    required this.navigator,
    required this.notificator,
  });

  void selectTab(int index) {
    selectedIndex.value = index;
  }

  selectProposed(String id) {
    navigator.navigateToDetalhesPage(id);
  }
}
