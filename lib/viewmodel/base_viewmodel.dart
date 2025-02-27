import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchilla/resources/app_logs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/services/events/notificator.dart';
import 'package:tchilla/services/events/validator.dart';
import 'package:tchilla/view/pages/error_page.dart';

class BaseViewModel extends GetxController {
  final Notificator notificator;
  final Validator validator;
  final Navigation navigator;
  final AppLogs loger;

  final RxBool isLoading = false.obs;
  final RxBool isError = false.obs;

  BaseViewModel({
    required this.notificator,
    required this.validator,
    required this.navigator,
    required this.loger,
  });

  void startLoading() {
    isLoading.value = true;
    resetError();
  }

  void stopLoading() {
    isLoading.value = false;
  }

  void resetError() {
    isError.value = false;
  }

  void emitError() {
    isError.value = true;
  }

  void handleError(
    BuildContext context,
    dynamic error,
    StackTrace? stacktrace,
  ) {
    notificator.showLocalError(
      AppLocalizations.of(context)!.error,
      error.toString(),
      context,
    );
  }

  Widget loadedErrorValidator({
    required bool error,
    required void Function([dynamic]) tryAgainEvet,
    required Widget view,
  }) {
    return error ? ErrorPage(tryAgainEvet: tryAgainEvet) : view;
  }

  void showWarning(BuildContext context, String message) {
    loger.info("Aviso: $message");
    notificator.showLocalAlert(
      AppLocalizations.of(context)!.alert_attention,
      message,
      context,
    );
  }

  void showSuccess(BuildContext context, String message) {
    loger.info("Sucesso: $message");
    notificator.showLocalASucess(
      AppLocalizations.of(context)!.alert_success,
      message,
      context,
    );
  }
}
