import 'dart:ffi';

import 'package:get/get.dart';
import 'package:tchilla/model/review_model.dart';
import 'package:tchilla/model/user_model.dart';
import 'package:tchilla/resources/app_routes.dart';
import 'package:tchilla/services/events/user_service.dart';
import 'package:tchilla/viewmodel/event/ischedules_detalhe_viewmodel.dart';

class ScheduleDetalheViewmodel extends ISchedulesDetalheViewmodel {
  final UserService _userService;
  final Rxn<ReviewModel?> _review = Rxn<ReviewModel?>();
  final Rxn<String> message = Rxn<String>();
  final RxDouble rantingValue = 0.0.obs;
  final Rxn<UserModel> _user = Rxn<UserModel>();
  final RxBool _userDataLoading = false.obs;
  RxBool get userDataLoading => _userDataLoading;

  ScheduleDetalheViewmodel({required UserService userService})
      : _userService = userService;

  Rxn<ReviewModel?> get review => _review;

  @override
  void goBack(String lastRouter) {
    if (lastRouter == AppRoutes.sucessSchedulesPage) {
      this.navigator.navigateToHome();
      return;
    }

    this.navigator.navigateToBack();
  }

  @override
  void setReview() {
    if (rantingValue.value == 0.0) {
      showWarning(localizations.error_fill_all_fields);
      return;
    }
    _review.value = ReviewModel(
        _user.value?.id, _user.value?.nome, message.value, rantingValue.value);
    this.navigator.navigateToBack();
  }

  @override
  void getUserData() async {
    await onEvent(
        event: (token) async {
          _userDataLoading.value = true;
          await onRequest(
              event: _userService.getUserData(token: token),
              onSuccess: (data) {
                _user.value = data;
              },
              onComplete: () {
                _userDataLoading.value = false;
              });
        },
        checkLogin: true);
  }

  @override
  void setMessage(String? value) {
    setFieldChange(message, value);
    loger.info('Message $message');
  }
}
