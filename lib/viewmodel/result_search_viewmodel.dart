import 'package:get/get.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/services/events/notificator.dart';

class ResultSearchViewModel extends GetxController {
  final Navigation navigator;
  final Notificator notificator;

  RxInt selectedIndex = 0.obs;
  RxList<String> tabTitles = [
    'Todas Ofertas',
    'Melhores Promoções',
    'Mais perto de si',
    'Mais solicitados',
    'Melhores custos e benefício',
  ].obs;
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
