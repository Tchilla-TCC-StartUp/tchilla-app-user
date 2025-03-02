import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchilla/resources/app_exception.dart';
import 'package:tchilla/resources/app_logs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/services/events/notificator.dart';
import 'package:tchilla/services/events/validator.dart';

class BaseViewModel extends GetxController {
  final Notificator notificator;
  final Validator validator;
  final Navigation navigator;
  final AppLogs loger;

  final RxBool isLoading = false.obs;
  final RxBool isError = false.obs;
  final RxString errorMessage = "".obs;
  final lang = Get.deviceLocale?.languageCode ?? "en";

  final Rxn<VoidCallback> lastRequest = Rxn<VoidCallback>();

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

  void showError(
    dynamic error,
  ) {
    notificator.showLocalError(
      AppLocalizations.of(notificator.snackbarKey.currentContext!)!.error,
      error.toString(),
    );
  }

  Future<T> request<T>({
    required Future<T> event,
    VoidCallback? onStart,
    ValueChanged<T>? onSuccess,
    ValueChanged<String>? onError,
    VoidCallback? onComplete,
  }) async {
    loger.info("✅ Última requisição armazenada!");
    onStart?.call();
    startLoading();

    return event.then((value) {
      onSuccess?.call(value);
      return value;
    }).catchError((error, stackTrace) {
      loger.printError(info: "Erro: $error");
      loger.printError(info: "StackTrace: $stackTrace");

      if (error is SocketException ||
          error is NetworkException ||
          error is UnknownException) {
        emitError(error.message);
      } else {
        showError(error.toString());
      }

      onError?.call(error);
      throw error;
    }).whenComplete(() {
      stopLoading();
      onComplete?.call();
    });
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
