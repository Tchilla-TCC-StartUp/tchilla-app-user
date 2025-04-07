import 'package:tchilla/viewmodel/base_viewmodel.dart';

abstract class IResultSearchViewmodel extends BaseViewModel {
  void selectTab(int index);
  selectProposed(String id);
}
