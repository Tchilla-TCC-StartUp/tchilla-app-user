import 'package:tchilla/viewmodel/base_viewmodel.dart';

abstract class ISchedulesViewmodel extends BaseViewModel {
  void initEvent();
  void getSchedules();
  Future<void> chengeLocalData();
}
