import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';

import 'app_global_text.dart';

class AppDialogs {
  static Future<void> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String message,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    String confirmText = "Confirmar",
    String cancelText = "Cancelar",
  }) async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onCancel?.call();
            },
            child: Text(cancelText),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm?.call();
            },
            child: Text(confirmText),
          ),
        ],
      ),
    );
  }

  static Future<void> showBodyDialog({
    required BuildContext context,
    required Widget body,
    required VoidCallback onConfirm,
    String title = "Avalie o serviço",
    String confirmText = "Enviar",
    String cancelText = "Cancelar",
    double maxHeight = 400,
  }) async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: AppGlobalText(text: title, style: TextStyleEnum.h3_bold,),
        content: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: maxHeight,
          ),
          child: SingleChildScrollView(
            child: body,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          AppGlobalTextButton(onPressed: Get.find<Navigation>().navigateToBack, textButton: cancelText, color: Colors.redAccent.shade700,),
          AppGlobalTextButton(onPressed: onConfirm, textButton: confirmText)

        ],
      ),
    );
  }


  static Future<void> showErrorDialog({
    required BuildContext context,
    String title = "Erro",
    required String message,
    String buttonText = "Fechar",
  }) async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title, style: const TextStyle(color: Colors.red)),
        content: Text(message),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
