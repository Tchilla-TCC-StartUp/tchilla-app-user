import 'package:flutter/material.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

abstract class IHomeViewmodel extends BaseViewModel {
  void setIsVisitor();
  void logoutVisitorMode();
  void selectTab(int index, FocusNode focusNode);
  void initLocalData();
  void getUserData();
  void navigateToProfilePage();
  void navigateToNotificationPage();
  void onFocus(FocusNode focusNode);
  void updateAdaptiveHeight(FocusNode focusNode);
  void initEvent();
}
