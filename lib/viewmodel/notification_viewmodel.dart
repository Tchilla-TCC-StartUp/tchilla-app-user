import 'package:get/get.dart';
import 'package:tchilla/model/local_notification_model.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

class NotificationViewmodel extends BaseViewModel {
  final RxList<LocalNotificationModel> _localnotification =
      <LocalNotificationModel>[].obs;

  RxList<LocalNotificationModel> get localnotification => _localnotification;

  void getNotifications() {
    setLocalData();
  }

  void setLocalData() {
    _localnotification.value = [
      LocalNotificationModel(
        proposedId: 12,
        title: 'Reserva Conformada',
        message: 'Sua reseva para o salão de Festa Mela foi confirmada ',
        isRead: false,
      ),
      LocalNotificationModel(
        proposedId: 12,
        title: 'Reserva Pendente',
        message: 'Sua reseva para o salão de Festa Mela está por confirmar',
        isRead: true,
      ),
      LocalNotificationModel(
        proposedId: 12,
        title: 'Reserva Canselada',
        message: 'Sua reseva para o salão de Festa Mela está foi cancelada',
        isRead: true,
      ),
    ];
  }
}
