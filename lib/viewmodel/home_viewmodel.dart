import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/model/event_type_model.dart';
import 'package:tchilla/model/service_model.dart';
import 'package:tchilla/model/user_model.dart';
import 'package:tchilla/resources/app_constats.dart';
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

  final RxBool _isVisitor = false.obs;
  RxBool get isVisitor => _isVisitor;

  void setIsVisitor() async {
    _isVisitor.value = true;
    loger.info("Entrou como Visitante!");
  }

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

  void initLocalData() async {
    tabTitlesForm.assignAll([
      localizations.tabVenueAndServices,
      localizations.tabLocal,
      localizations.tabServices,
    ]);
    _homeData.value = HomeModel(userName: localizations.visitor, guestNumbers: [
      50,
      100,
      200,
      300,
      400,
      500,
    ], eventTypes: [
      EventTypeModel(1, 'Casamento'),
      EventTypeModel(2, 'Aniversário'),
      EventTypeModel(3, 'Formatura'),
      EventTypeModel(4, 'Festa de 15 anos'),
      EventTypeModel(5, 'Festa de Réveillon'),
    ], services: [
      ServiceModel(1, 'Buffet'),
      ServiceModel(2, 'Decoração'),
      ServiceModel(3, 'Música'),
      ServiceModel(4, 'Fotografia'),
      ServiceModel(5, 'Filmagem'),
      ServiceModel(6, 'Iluminação'),
      ServiceModel(7, 'Transporte'),
      ServiceModel(8, 'Segurança'),
      ServiceModel(9, 'Limpeza'),
    ]);
  }

  void getUserData() async {
    await onEvent(
        checkLogin: true,
        event: (token) async {
          await onRequest(
            event: service.getUserData(token: token),
            onSuccess: (data) {
              _userData.value = UserModel(data.id, data.nome, data.telefone,
                  data.email, "${AppConstats.baseUrl}${data.foto}");
            },
          );
        },
        onErrorAuth: () async {
          initLocalData();
          setIsVisitor();
        });
  }

  void navigateToProfilePage() async {
    onEvent(
        // checkLogin: true,
        event: (token) async {
      this.navigator.navigateToProfilePage(
            _userData.value?.nome ?? '',
            _userData.value?.foto ?? '',
          );
    }, onErrorAuth: () {
      showError(localizations.visitorAccessDenied);
    });
  }

  void navigateToNotificationPage() async {
    await onEvent(
      checkLogin: true,
      event: (token) async {
        this.navigator.navigateToNotificationPage();
      },
      onErrorAuth: () {
        showError(localizations.visitorAccessDenied);
      },
    );
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
