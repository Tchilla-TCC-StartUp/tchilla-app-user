import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/view/widgets/app_global_data_picker.dart';
import 'package:tchilla/view/widgets/app_global_dropdown_menu.dart';
import 'package:tchilla/view/widgets/app_global_input.dart';
import 'package:tchilla/view/widgets/app_global_service_tags_manager.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_global_time_picker.dart';
import 'package:tchilla/viewmodel/home_viewmodel.dart';

class FormLocalEndService extends StatelessWidget {
  const FormLocalEndService({
    super.key,
    required FocusNode locationFocusNode,
    required this.viewmodel,
  }) : _locationFocusNode = locationFocusNode;

  final FocusNode _locationFocusNode;
  final HomeViewModel viewmodel;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AppGlobalInput(
            helpText: "Local Evento",
            hintText: "EX: provincia/municipio/bairro",
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            focusNode: _locationFocusNode,
          ),
          AppGlobalVericalSpacing(
            value: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppGlobalDatePicker(
                helpText: "Data do Evento",
                hintText: "25 NOV 2025",
                width: 37.w,
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
                onDateSelected: (DateTime date) {
                  print("Data selecionada: $date");
                },
              ),
              AppGlobalDropdownMenu(
                helpText: "Tipo Evento",
                hintText: "Casamento",
                width: 37.w,
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: "OP1", label: "Casamento"),
                  DropdownMenuEntry(value: "OP1", label: "Pedido"),
                  DropdownMenuEntry(value: "OP1", label: "Aniversário"),
                  DropdownMenuEntry(value: "OP1", label: "Noivado"),
                ],
              ),
            ],
          ),
          AppGlobalVericalSpacing(
            value: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppGlobalTimePicker(
                helpText: 'Horade Início',
                hintText: "00:00",
                width: 37.w,
                onDateSelected: (value) {},
              ),
              AppGlobalTimePicker(
                helpText: 'Hora de Fim',
                hintText: "00:00",
                width: 37.w,
                onDateSelected: (value) {},
              ),
            ],
          ),
          AppGlobalVericalSpacing(
            value: 1.h,
          ),
          AppGlobalDropdownMenu(
            helpText: "N de Convidados",
            hintText: "150 Convidados",
            width: 80.w,
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: "OP1", label: "150 Convidados"),
              DropdownMenuEntry(value: "OP1", label: "300 Convidadoso"),
              DropdownMenuEntry(value: "OP1", label: "600 Convidados"),
              DropdownMenuEntry(value: "OP1", label: "1200 Convidados"),
            ],
          ),
          AppGlobalVericalSpacing(
            value: 1.h,
          ),
          AppGlobalServiceTagsManager(
            helpText: "Adicionar Serviço",
            hintText: "Selecione um serviço",
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: "Decoracao", label: "Decoração"),
              DropdownMenuEntry(value: "DJ", label: "DJ"),
              DropdownMenuEntry(value: "Confeiteiro", label: "Confeiteiro"),
              DropdownMenuEntry(value: "Bartender", label: "Bartender"),
            ],
            onChanged: (selectedTags) {
              print("Tags Selecionadas: $selectedTags");
            },
          ),
          AppGlobalTextButton(
            minWidth: 80.w,
            textButton: "Pesquisar",
            onPressed: viewmodel.navigateToResultSearchPage,
          ),
        ],
      ),
    );
  }
}
