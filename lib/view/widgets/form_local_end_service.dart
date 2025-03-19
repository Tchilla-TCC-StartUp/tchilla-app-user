import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/view/widgets/app_global_data_picker.dart';
import 'package:tchilla/view/widgets/app_global_dropdown_menu.dart';
import 'package:tchilla/view/widgets/app_global_input.dart';
import 'package:tchilla/view/widgets/app_global_service_tags_manager.dart';
import 'package:tchilla/view/widgets/app_global_show_and_hide_animation.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_global_time_picker.dart';
import 'package:tchilla/viewmodel/home_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FormLocalEndService extends StatefulWidget {
  const FormLocalEndService({
    super.key,
    required FocusNode focusNode,
    required this.viewmodel,
  }) : locationFocusNode = focusNode;

  final FocusNode locationFocusNode;
  final HomeViewModel viewmodel;

  @override
  State<FormLocalEndService> createState() => _FormLocalEndServiceState();
}

class _FormLocalEndServiceState extends State<FormLocalEndService> {
  @override
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
    List<int> serviceList = [];
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
                    onDateSelected: (DateTime date) {
                      print("Data selecionada: $date");
                    },
                  ),
                  AppGlobalDropdownMenu(
                    helpText: AppLocalizations.of(context)!.event_type,
                    hintText: widget.viewmodel.localizations.wedding,
                    width: 37.w,
                    onSelected: (value) {
                      eventTypeController = value ?? '';
                      widget.viewmodel.loger
                          .info('Tipo de evento: ${value.toString()}');
                    },
                    dropdownMenuEntries: widget
                            .viewmodel.homeData.value?.eventTypes
                            ?.map((e) => DropdownMenuEntry(
                                value: e.id, label: e.label ?? ''))
                            .toList() ??
                        [],
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
                    onDateSelected: (value) {},
                  ),
                  AppGlobalTimePicker(
                    helpText: AppLocalizations.of(context)!.end_time,
                    hintText: "00:00",
                    width: 37.w,
                    onDateSelected: (value) {},
                  ),
                ],
              ),
              const AppGlobalVericalSpacing(),
              AppGlobalDropdownMenu(
                helpText: AppLocalizations.of(context)!.number_of_guests,
                hintText: "200 ${widget.viewmodel.localizations.guests}",
                width: 80.w,
                onSelected: (value) {
                  guestsNumberController = value;
                  widget.viewmodel.loger
                      .info('Numero de Convidados: ${value.toString()}');
                },
                dropdownMenuEntries:
                    widget.viewmodel.homeData.value?.guestNumbers
                            ?.map((e) => DropdownMenuEntry(
                                  value: e,
                                  label:
                                      '${e.toString()} ${widget.viewmodel.localizations.guests}',
                                ))
                            .toList() ??
                        [],
              ),
              const AppGlobalVericalSpacing(),
              AppGlobalServiceTagsManager(
                helpText: AppLocalizations.of(context)!.add_services,
                hintText: AppLocalizations.of(context)!.select_service,
                dropdownMenuEntries: widget.viewmodel.homeData.value?.services
                        ?.where((e) => e.id != null)
                        .map(
                          (e) => DropdownMenuEntry<int>(
                            value: e.id!,
                            label: e.label ?? '',
                          ),
                        )
                        .toList() ??
                    [],
                onChanged: (selectedTags) {
                  print("Tags Selecionadas: $selectedTags");
                },
              ),
            ],
          ),
          AppGlobalTextButton(
            minWidth: 80.w,
            textButton: AppLocalizations.of(context)!.search,
            onPressed: widget.viewmodel.navigateToResultSearchPage,
          ),
        ],
      ),
    );
  }
}
