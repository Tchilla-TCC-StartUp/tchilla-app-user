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
    Color color;
    String message;
    switch (status) {
      case ProposedStatus.cancelad:
        message = "Cancelado";
        color = Colors.redAccent.shade700;
      case ProposedStatus.sucess:
        message = "Realizado";
        color = Colors.greenAccent.shade700;
      case ProposedStatus.pending:
        message = "Pendente";
        color = Colors.amberAccent.shade700;
      case ProposedStatus.schedule:
        message = "Agendado";
        color = Colors.blueAccent.shade700;
    }
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: AppGlobalText(
        text: message,
        style: TextStyleEnum.button_text,
        color: color,
      ),
    );
  }
}
