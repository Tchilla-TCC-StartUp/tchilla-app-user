import 'package:flutter/material.dart';
import 'package:tchilla/resources/app_enums.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class LabelStatusProposed extends StatelessWidget {
  final ProposedStatus status;
  const LabelStatusProposed({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return _buildState(status: status);
  }

  _buildState({required ProposedStatus status}) {
    switch (status) {
      case ProposedStatus.cancelad:
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.3),
            borderRadius: BorderRadius.circular(6),
          ),
          child: AppGlobalText(
            text: "Cancelado",
            style: TextStyleEnum.button_text,
            color: Colors.red.shade900,
          ),
        );
      case ProposedStatus.sucess:
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.3),
            borderRadius: BorderRadius.circular(6),
          ),
          child: AppGlobalText(
            text: "Realizado",
            style: TextStyleEnum.button_text,
            color: Colors.green.shade900,
          ),
        );
      case ProposedStatus.pending:
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.3),
            borderRadius: BorderRadius.circular(6),
          ),
          child: AppGlobalText(
            text: "Pendente",
            style: TextStyleEnum.button_text,
            color: Colors.amber.shade900,
          ),
        );
    }
  }
}
