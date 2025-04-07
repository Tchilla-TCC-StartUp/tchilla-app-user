import 'package:get/get.dart';
import 'package:tchilla/viewmodel/interface/iresult_search_viewmodel.dart';

class ResultSearchViewModel extends IResultSearchViewmodel {
  RxInt selectedIndex = 0.obs;
  RxList<String> tabTitles = [
    'Todas Ofertas',
    'Melhores Promoções',
    'Mais perto de si',
    'Mais solicitados',
    'Melhores custos e benefício',
  ].obs;

  @override
  void selectTab(int index) {
    selectedIndex.value = index;
  }

  @override
  selectProposed(String id) {
    this.navigator.navigateToDetalhesPage(id);
  }
}
