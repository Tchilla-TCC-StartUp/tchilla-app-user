import 'package:get/get.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

class ViewMoreViewmodel extends BaseViewModel {
  RxList<String> tabTitlesSegestions = [
    "Casamento",
    "Pedido",
    "Noivado",
    "Aniversario",
    "Corporativos",
    "Religos",
  ].obs;

  RxInt selectedIndex = 0.obs;

  ViewMoreViewmodel(
      {required super.notificator,
      required super.validator,
      required super.navigator,
      required super.loger});

  void selectTab(int index) {
    selectedIndex.value = index;
  }

  void selectProposed(String id) {
    this.navigator.navigateToDetalhesPage(id);
  }

  navigateToResultSearchPage() {
    return this.navigator.navigateToResultSearchPage();
  }
}
