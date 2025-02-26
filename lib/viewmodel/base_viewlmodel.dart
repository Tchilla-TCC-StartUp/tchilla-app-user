import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchilla/resources/app_logs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/services/events/notificator.dart';
import 'package:tchilla/services/events/validator.dart';
import 'package:tchilla/view/pages/error_page.dart';

class BaseViewlmodel extends GetxController {
  final Notificator notificator;
  final Validator validator;
  final Navigation navigator;
  final AppLogs loger;
  BaseViewlmodel({
    required this.notificator,
    required this.validator,
    required this.navigator,
    required this.loger,
  });

  void handleError(
    BuildContext context,
    dynamic error,
    StackTrace? stacktrace,
  ) {
    loger.error("Erro: ${error.toString()}", stacktrace);
    notificator.showLocalError(
      AppLocalizations.of(context)!.error,
      error.toString(),
      context,
    );
  }

  Widget loadedErrorValidator({
    required bool loaded,
    required void Function([dynamic]) tryAgainEvet,
    required Widget view,
  }) {
    return loaded ? view : ErrorPage(tryAgainEvet: tryAgainEvet);
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
