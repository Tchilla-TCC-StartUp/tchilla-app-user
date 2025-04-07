import 'package:get/get.dart';
import 'package:tchilla/viewmodel/interface/iview_more_viewmodel.dart';

class ViewMoreViewmodel extends IViewMoreViewmodel {
  RxList<String> tabTitlesSegestions = [
    "Casamento",
    "Pedido",
    "Noivado",
    "Aniversario",
    "Corporativos",
    "Religos",
  ].obs;

  RxInt selectedIndex = 0.obs;

  @override
  void selectTab(int index) {
    selectedIndex.value = index;
  }

  @override
  void selectProposed(String id) {
    this.navigator.navigateToDetalhesPage(id);
  }

  @override
  navigateToResultSearchPage() {
    return this.navigator.navigateToResultSearchPage();
  }
}
