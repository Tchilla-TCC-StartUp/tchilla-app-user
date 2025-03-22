import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchilla/data/event/local_token_data.dart';
import 'package:tchilla/resources/app_constats.dart';
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
  final RxBool isLoading = false.obs;
  final LocalTokenData dataToken = Get.find();
  final RxBool isError = false.obs;
  final RxString errorMessage = "".obs;
  final lang = Get.deviceLocale?.languageCode ?? "en";
  final RxString _token = "".obs;
  RxString get token => _token;

  final RxBool _isAuth = false.obs;
  RxBool get isAuth => _isAuth;

  final Rxn<VoidCallback> lastRequest = Rxn<VoidCallback>();
  BuildContext get context => notificator.snackbarKey.currentContext!;
  AppLocalizations get localizations => AppLocalizations.of(context)!;

  void startLoading() {
    isLoading.value = true;
    resetError();
  }

  void setIsAuth() {
    _isAuth.value = true;
  }

  void stopLoading() {
    isLoading.value = false;
  }

  void setToken(String value) {
    _token.value = value;
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

  Future<T> onRequest<T>({
    required Future<T> event,
    VoidCallback? onStart,
    ValueChanged<T>? onSuccess,
    ValueChanged<T>? onError,
    ValueChanged<T>? onErrorAuth,
    VoidCallback? onComplete,
  }) async {
    // checkinLogin();
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
      } else if (error is UnauthorizedException) {
        showError(error);
        cleanToken();
        navigator.navigateToWelcomePage();
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

  Future<void> checkinLogin() async {
    try {
      var value = await dataToken.fetchToken() ?? "";
      setToken(value);

      if (token.isNotEmpty) {
        loger.info("Usuário já está logado. Token encontrado: $token");
        setIsAuth();
        return;
      }
      loger.info("O User está logado?: $isAuth");
    } catch (e) {
      loger.info(
        "Erro ao verificar login: $e",
      );
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

  void desableFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void setFieldChange(
    Rxn<dynamic> field,
    dynamic newValue,
  ) {
    _behaviorSubjectChange(field, newValue);
  }

  bool _behaviorSubjectChange(
    Rxn<dynamic> field,
    dynamic newValue,
  ) {
    if (field.value != newValue) {
      field.value = newValue;
      return true;
    }

    return false;
  }

  bool setListFieldChange<T>(
    List<Rxn<T>> field,
    List<T> newValue, {
    bool Function(T? a, T b)? compareFn,
  }) {
    return _behaviorListSubjectChange(field, newValue, compareFn: compareFn);
  }

  bool _behaviorListSubjectChange<T>(
    List<Rxn<T>> field,
    List<T> newValue, {
    bool Function(T? a, T b)? compareFn,
  }) {
    compareFn ??= (a, b) => a == b;

    if (field.length != newValue.length ||
        !_areGenericListsEqual(
            field.map((e) => e.value).toList(), newValue, compareFn)) {
      field
        ..clear()
        ..addAll(newValue.map((e) => Rxn<T>(e)));
      return true;
    }
    return false;
  }

  bool _areGenericListsEqual<T>(
    List<T?> a,
    List<T> b,
    bool Function(T? a, T b) compareFn,
  ) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (!compareFn(a[i], b[i])) return false;
    }
    return true;
  }

  String getImageUrl(String? image) {
    final imageUrl = "${AppConstats.baseUrl}$image";

    loger.info("URL da imagem: $imageUrl");
    return imageUrl;
  }

  Future<bool> checkInNetworkConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    final connectionType = connectionTypeLabel(connectivityResult);
    loger.info("O app está conectado com a internet via: $connectionType");

    return connectivityResult != ConnectivityResult.none;
  }
}
