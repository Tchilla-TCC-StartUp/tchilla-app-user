import 'package:tchilla/viewmodel/base_viewmodel.dart';

abstract class IViewMoreViewmodel extends BaseViewModel {
  void selectTab(int index);
  void selectProposed(String id);
  navigateToResultSearchPage();
}
