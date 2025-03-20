import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/model/event_type_model.dart';
import 'package:tchilla/model/service_model.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';
import 'package:tchilla/model/home_model.dart';
class HomeViewModel extends BaseViewModel {
  RxInt selectedIndex = 0.obs;
  RxDouble adptiveHeight = 510.px.obs;
  RxDouble adptiveSilverExpade = 780.px.obs;
  final RxBool isVisible = true.obs;

  final RxList<String> tabTitlesForm = <String>[].obs;
  final Rxn<HomeModel> _homeData = Rxn<HomeModel>();
  Rxn<HomeModel> get homeData => _homeData;

  void selectTab(int index, FocusNode focusNode) {
    focusNode.unfocus();
    selectedIndex.value = index;
    updateAdaptiveHeight(focusNode);
  }

  @override
  void onReady() {
    super.onReady();
    initLocalData();
  }

  void initLocalData() {
    homeData.value = HomeModel(
        userName: localizations.visitor,
        guestNumbers: [
          50,
          100,
          200,
          300,
          400,
          500,
        ], // exemplo
        eventTypes: [
          EventTypeModel(1, 'Casamento'),
          EventTypeModel(2, 'Aniversário'),
          EventTypeModel(3, 'Formatura'),
          EventTypeModel(4, 'Festa de 15 anos'),
          EventTypeModel(5, 'Festa de Réveillon'),
          EventTypeModel(6, 'Festa de Natal'),
          EventTypeModel(7, 'Festa de Ano Novo'),
          EventTypeModel(8, 'Festa de Carnaval'),
          EventTypeModel(9, 'Festa de São João'),
          EventTypeModel(10, 'Festa de São Pedro'),
          EventTypeModel(11, 'Festa de São Paulo'),
          EventTypeModel(12, 'Festa de São Jorge'),
          EventTypeModel(13, 'Festa de São Miguel'),
          EventTypeModel(14, 'Festa de São Sebastião'),
        ],
        services: [
          ServiceModel(1, 'Buffet'),
          ServiceModel(2, 'Decoração'),
          ServiceModel(3, 'Música'),
          ServiceModel(4, 'Fotografia'),
          ServiceModel(5, 'Filmagem'),
          ServiceModel(6, 'Iluminação'),
          ServiceModel(7, 'Transporte'),
          ServiceModel(8, 'Segurança'),
          ServiceModel(9, 'Limpeza'),
          ServiceModel(10, 'Serviço de Bar'),
          ServiceModel(11, 'Serviço de Garçom'),
          ServiceModel(12, 'Serviço de Cozinha'),
          ServiceModel(13, 'Serviço de Buffet'),
        ]);

    tabTitlesForm.assignAll([
      localizations.tabLocal,
      localizations.tabServices,
      localizations.tabVenueAndServices,
    ]);
  }

  void navigateToProfilePage() async {
    final bool isAuth = await checkinLogin();

    if (isAuth) {
      this.navigator.navigateToProfilePage();
      return;
    }
    return showError(localizations.visitorAccessDenied);

    // return this.navigator.navigateToProfilePage();
  }

  navigateToResultSearchPage() {
    return this.navigator.navigateToResultSearchPage();
  }

  Future<void> searchLocal(
    String local,
    DateTime data,
    int envitNumber,
    BuildContext context,
  ) {
    return this.navigator.navigateToResultSearchPage();
  }

  void onFocus(FocusNode focusNode) {
    var focus = isVisible.value = focusNode.hasFocus;
    adptiveHeight.value = focus ? 220.px : 520.px;
    adptiveSilverExpade.value = focus ? 480.px : 780.px;
  }

  void updateAdaptiveHeight(FocusNode focusNode) {
    switch (selectedIndex.value) {
      case 0:
        adptiveHeight.value = 520.px;
        adptiveSilverExpade.value = 780.px;
        break;
      case 1:
        adptiveHeight.value = 625.px;
        adptiveSilverExpade.value = 880.px;
        break;
      case 2:
        adptiveHeight.value = 625.px;
        adptiveSilverExpade.value = 880.px;
        break;
      default:
        adptiveHeight.value = 520.px;
        adptiveSilverExpade.value = 780.px;
        break;
    }
  }
}
