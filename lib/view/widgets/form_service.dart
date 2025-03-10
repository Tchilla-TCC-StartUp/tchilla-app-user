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

class FormService extends StatefulWidget {
  const FormService({
    super.key,
    required FocusNode focusNode,
    required this.viewmodel,
  }) : locationFocusNode = focusNode;

  final FocusNode locationFocusNode;
  final HomeViewModel viewmodel;

  @override
  State<FormService> createState() => _FormServiceState();
}

class _FormServiceState extends State<FormService> {
  
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
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                    onDateSelected: (DateTime date) {
                      print("Data selecionada: $date");
                    },
                  ),
                  AppGlobalDropdownMenu(
                    helpText: AppLocalizations.of(context)!.event_type,
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
                hintText: "150 Convidados",
                width: 80.w,
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: "OP1", label: "150 Convidados"),
                  DropdownMenuEntry(value: "OP1", label: "300 Convidadoso"),
                  DropdownMenuEntry(value: "OP1", label: "600 Convidados"),
                  DropdownMenuEntry(value: "OP1", label: "1200 Convidados"),
                ],
              ),
              const AppGlobalVericalSpacing(),
              AppGlobalServiceTagsManager(
                helpText: AppLocalizations.of(context)!.add_services,
                hintText: AppLocalizations.of(context)!.select_service,
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
