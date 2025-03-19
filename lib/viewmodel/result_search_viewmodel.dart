import 'package:get/get.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

class ResultSearchViewModel extends BaseViewModel {
  RxInt selectedIndex = 0.obs;
  RxList<String> tabTitles = [
    'Todas Ofertas',
    'Melhores Promoções',
    'Mais perto de si',
    'Mais solicitados',
    'Melhores custos e benefício',
  ].obs;


  void selectTab(int index) {
    selectedIndex.value = index;
  }

  selectProposed(String id) {
    this.navigator.navigateToDetalhesPage(id);
  }
}
