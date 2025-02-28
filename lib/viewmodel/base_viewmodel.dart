import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchilla/resources/app_logs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/services/events/notificator.dart';
import 'package:tchilla/services/events/validator.dart';
import 'package:tchilla/view/pages/error_try_again.dart';

abstract class BaseViewModel extends GetxController {
  final Notificator notificator;
  final Validator validator;
  final Navigation navigator;
  final AppLogs loger;

  final RxBool isLoading = false.obs;
  final RxBool isError = false.obs;
  final RxString errorMessage = "".obs;

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

  void emitError(final String message) {
    isError.value = true;
    errorMessage.value = message;
  }

  void handleError(
    BuildContext context,
    dynamic error,
    StackTrace? stacktrace,
  ) {
    notificator.showLocalError(
      AppLocalizations.of(context)!.error,
      error.toString(),
    );
  }

  Widget buildErrorValidatedView({
    required bool error,
    required void Function([dynamic]) tryAgainEvet,
    required Widget view,
    required String message,
  }) {
    return error
        ? ErrorTryAgain(
            tryAgainEvet: tryAgainEvet,
            message: message,
          )
        : view;
  }

  void showWarning(BuildContext context, String message) {
    loger.info("Aviso: $message");
    notificator.showLocalAlert(
      AppLocalizations.of(context)!.alert_attention,
      message,
    );
  }

  void showSuccess(BuildContext context, String message) {
    loger.info("Sucesso: $message");
    notificator.showLocalASucess(
      AppLocalizations.of(context)!.alert_success,
      message,
    );
  }
}
