import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/view/widgets/app_global_data_picker.dart';
import 'package:tchilla/view/widgets/app_global_dropdown_menu.dart';
import 'package:tchilla/view/widgets/app_global_input.dart';
import 'package:tchilla/view/widgets/app_global_show_and_hide_animation.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_global_time_picker.dart';
import 'package:tchilla/viewmodel/home_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FormLocal extends StatefulWidget {
  const FormLocal({
    super.key,
    required FocusNode focusNode,
    required this.viewmodel,
  }) : locationFocusNode = focusNode;

  final FocusNode locationFocusNode;
  final HomeViewModel viewmodel;

  @override
  State<FormLocal> createState() => _FormLocalState();
}

class _FormLocalState extends State<FormLocal> {
  void initState() {
    super.initState();
    widget.locationFocusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    widget.viewmodel.onFocus(widget.locationFocusNode);
  }

  @override
  void dispose() {
    widget.locationFocusNode.removeListener(_handleFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localController = TextEditingController();
    TimeOfDay startTimeController;
    TimeOfDay endTimeController;
    DateTime dataEventController;
    int eventTypeController;
    int guestsNumberController;
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AppGlobalInput(
            helpText: AppLocalizations.of(context)!.event_location,
            hintText: AppLocalizations.of(context)!.event_location_placeholder,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            focusNode: widget.locationFocusNode,
            controller: localController,
          ),
          AppGlobalShowAndHideAnimation(
            focusNodes: [widget.locationFocusNode],
            children: [
              const AppGlobalVericalSpacing(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppGlobalDatePicker(
                    helpText: AppLocalizations.of(context)!.event_date,
                    hintText: "25 NOV 2025",
                    width: 37.w,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                    onDateSelected: (date) {
                      dataEventController = date;
                      widget.viewmodel.loger
                          .info('Data do evento: ${date.toString()}');
                    },
                  ),
                  AppGlobalDropdownMenu(
                    helpText: AppLocalizations.of(context)!.event_type,
                    hintText: "Casamento",
                    width: 37.w,
                    onSelected: (value) {
                      eventTypeController = value ?? '';
                      widget.viewmodel.loger
                          .info('Tipo de evento: ${value.toString()}');
                    },
                    dropdownMenuEntries: const [
                      DropdownMenuEntry(value: 1, label: "Casamento"),
                      DropdownMenuEntry(value: 2, label: "Pedido"),
                      DropdownMenuEntry(value: 3, label: "Aniversário"),
                      DropdownMenuEntry(value: 4, label: "Aniversário"),
                    ],
                  ),
                ],
              ),
              const AppGlobalVericalSpacing(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppGlobalTimePicker(
                    helpText: AppLocalizations.of(context)!.start_time,
                    hintText: "00:00",
                    width: 37.w,
                    onDateSelected: (value) {
                      startTimeController = value;
                      widget.viewmodel.loger.info('Hora de início: $value');
                    },
                  ),
                  AppGlobalTimePicker(
                    helpText: AppLocalizations.of(context)!.end_time,
                    hintText: "00:00",
                    width: 37.w,
                    onDateSelected: (value) {
                      endTimeController = value;
                      widget.viewmodel.loger.info('Hora de termino: $value}');
                    },
                  ),
                ],
              ),
              const AppGlobalVericalSpacing(),
              AppGlobalDropdownMenu(
                helpText: AppLocalizations.of(context)!.number_of_guests,
                hintText: "150 Convidados",
                width: 80.w,
                onSelected: (value) {
                  guestsNumberController = value;
                  widget.viewmodel.loger
                      .info('Numero de Convidados: ${value.toString()}');
                },
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: 150, label: "150 Convidados"),
                  DropdownMenuEntry(value: 300, label: "300 Convidadoso"),
                  DropdownMenuEntry(value: 600, label: "600 Convidados"),
                  DropdownMenuEntry(value: 1299, label: "1200 Convidados"),
                ],
              ),
            ],
          ),
          const AppGlobalVericalSpacing(),
          AppGlobalTextButton(
            minWidth: 80.w,
            textButton: AppLocalizations.of(context)!.search,
            onPressed: widget.viewmodel.navigateToResultSearchPage,
          ),

          // HomeIndicatorBanner()
        ],
      ),
    );
  }
}
