import 'package:tchilla/viewmodel/base_viewmodel.dart';

abstract class ISchedulesViewmodel extends BaseViewModel {
  void getSchedules();
  void goToDetalhes( id);
  Future<void> chengeLocalData();
}
