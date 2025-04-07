import 'package:tchilla/viewmodel/base_viewmodel.dart';

abstract class INotificationViewmodel extends BaseViewModel {
  void getNotifications();
  void setLocalData();
}
