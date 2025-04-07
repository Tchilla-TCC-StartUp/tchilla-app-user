import 'package:tchilla/viewmodel/base_viewmodel.dart';

abstract class ISchedulesViewmodel extends BaseViewModel {
  void initEvent();
  Future<void> chengeLocalData();
}
