import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchilla/data/event/local_token_data.dart';
import 'package:tchilla/resources/app_exception.dart';
import 'package:tchilla/resources/app_logs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/services/events/notificator.dart';
import 'package:tchilla/services/events/validator.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class BaseViewModel extends GetxController {
  final Notificator notificator = Get.find();
  final Validator validator = Get.find();
  final Navigation navigator = Get.find();
  final AppLogs loger = Get.find();
  final LocalTokenData dataToken = Get.find();
  final RxBool isLoading = false.obs;
  final RxBool isError = false.obs;
  final RxString errorMessage = "".obs;
  final lang = Get.deviceLocale?.languageCode ?? "en";

  final Rxn<VoidCallback> lastRequest = Rxn<VoidCallback>();

  BuildContext get context => notificator.snackbarKey.currentContext!;

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
      AppLocalizations.of(context)!.error,
      error.toString(),
    );
  }

  Future<T> request<T>({
    required Future<T> event,
    VoidCallback? onStart,
    ValueChanged<T>? onSuccess,
    ValueChanged<T>? onError,
    VoidCallback? onComplete,
  }) async {
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
          error is UnknownException ||
          error is ServerException) {
        emitError(error.message);
        showError(error);
      } else {
        showError(error);
      }

      onError?.call(error);
      throw error;
    }).whenComplete(() {
      stopLoading();
      onComplete?.call();
    });
  }

  Future<bool> checkinLogin() async {
    try {
      final token = await dataToken.fetchToken();

      if (token?.isNotEmpty ?? false) {
        loger.info("Usuário já está logado. Token encontrado: $token");
        return true;
      }
      loger.printInfo(info: "Usuário não está logado. Token ausente.");
      return false;
    } catch (e) {
      loger.info(
        "Erro ao verificar login: $e",
      );
      return false;
    }
  }

  Future<void> cleanToken() {
    return dataToken.deletoken();
  }

  void showWarning(String message) {
    loger.info("Aviso: $message");
    notificator.showLocalAlert(
      AppLocalizations.of(context)!.alert_attention,
      message,
    );
  }

  void showSuccess(String message) {
    loger.info("Sucesso: $message");
    notificator.showLocalASucess(
      AppLocalizations.of(context)!.alert_success,
      message,
    );
  }

  String connectionTypeLabel(List<ConnectivityResult> result) {
    switch (result) {
      case ConnectivityResult.wifi:
        return "Wi-Fi";
      case ConnectivityResult.mobile:
        return "Dados móveis";
      case ConnectivityResult.ethernet:
        return "Cabo Ethernet";
      case ConnectivityResult.bluetooth:
        return "Bluetooth";
      case ConnectivityResult.none:
        return "Sem conexão";
      default:
        return "Desconhecido";
    }
  }

  Future<bool> checkInNetworkConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    final connectionType = connectionTypeLabel(connectivityResult);
    loger.info("O app está conectado com a internet via: $connectionType");

    return connectivityResult != ConnectivityResult.none;
  }
}
