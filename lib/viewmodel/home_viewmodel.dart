import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/model/event_type_model.dart';
import 'package:tchilla/model/service_model.dart';
import 'package:tchilla/model/user_model.dart';
import 'package:tchilla/services/events/home_service.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';
import 'package:tchilla/model/home_model.dart';

class HomeViewModel extends BaseViewModel {
  final HomeService service;
  HomeViewModel({required this.service});
  RxInt selectedIndex = 0.obs;
  RxDouble adptiveHeight = 625.px.obs;
  RxDouble adptiveSilverExpade = 880.px.obs;
  final RxBool isVisible = true.obs;

  final RxList<String> tabTitlesForm = <String>[].obs;
  final Rxn<HomeModel> _homeData = Rxn<HomeModel>();
  final Rxn<UserModel> _userData = Rxn<UserModel>();

  Rxn<HomeModel> get homeData => _homeData;
  Rxn<UserModel> get userData => _userData;

  void selectTab(int index, FocusNode focusNode) {
    desableFocus();
    focusNode.unfocus();
    selectedIndex.value = index;
    updateAdaptiveHeight(focusNode);
  }

  @override
  void onReady() {
    super.onReady();
    initLocalData();
  }

  void initEvet() {
    getUserData();
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
      localizations.tabVenueAndServices,
      localizations.tabLocal,
      localizations.tabServices,
    ]);
  }

  void getUserData() async {
    await checkinLogin();
    if (isAuth.value) {
      await onRequest(
        event: service.getUserData(token: token.value),
        onSuccess: (data) {
          _userData.value = data;
        },
      );
      return;
    }
    initLocalData();
  }

  void navigateToProfilePage() async {
    await checkinLogin();
    if (isAuth.value) {
      loger.info("O nome o user é ${_userData.value?.nome}");
      this.navigator.navigateToProfilePage(
            _userData.value?.nome ?? '',
            _userData.value?.foto ?? '',
          );
      return;
    }
    return showError(localizations.visitorAccessDenied);
  }

  void navigateToNotificationPage() {
    // checkinLogin();
    // if (isAuth.value) {
    //   this.navigator.navigateToNotificationPage();
    //   return;
    // }
    // return showError(localizations.visitorAccessDenied);

    this.navigator.navigateToNotificationPage();
  }

  navigateToResultSearchPage() {
    return this.navigator.navigateToResultSearchPage();
  }

  void onFocus(FocusNode focusNode) {
    var focus = isVisible.value = focusNode.hasFocus;
    adptiveHeight.value = focus ? 220.px : 520.px;
    adptiveSilverExpade.value = focus ? 480.px : 780.px;
  }

  void updateAdaptiveHeight(FocusNode focusNode) {
    switch (selectedIndex.value) {
      case 1:
        adptiveHeight.value = 520.px;
        adptiveSilverExpade.value = 780.px;
        break;
      case 0:
        adptiveHeight.value = 625.px;
        adptiveSilverExpade.value = 880.px;
        break;
      case 2:
        adptiveHeight.value = 625.px;
        adptiveSilverExpade.value = 880.px;
        break;
      default:
        adptiveHeight.value = 625.px;
        adptiveSilverExpade.value = 880.px;
        break;
    }
  }
}
