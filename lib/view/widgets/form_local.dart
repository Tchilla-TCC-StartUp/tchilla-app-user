// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:tchilla/model/event_type_model.dart';
import 'package:tchilla/view/widgets/app_global_data_picker.dart';
import 'package:tchilla/view/widgets/app_global_input.dart';
import 'package:tchilla/view/widgets/app_global_searchI_input.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_global_time_picker.dart';
import 'package:tchilla/viewmodel/form_local_viewmodel.dart';
import 'package:tchilla/viewmodel/home_viewmodel.dart';

class FormLocal extends StatefulWidget {
  const FormLocal({
    Key? key,
    required this.homeViewmodel,
  }) : super(key: key);

  final HomeViewModel homeViewmodel;

  @override
  State<FormLocal> createState() => _FormLocalState();
}

class _FormLocalState extends State<FormLocal> {
  final viewmodel = Get.find<FormLocalViewmodel>();
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
            // focusNode: widget.locationFocusNode,
            // controller: localController,
            onChanged: viewmodel.setLocalEvent,
          ),
          const AppGlobalVericalSpacing(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppGlobalDatePicker(
                helpText: AppLocalizations.of(context)!.event_date,
                hintText: "25 NOV 2025",
                width: 37.w,
                onDateSelected: viewmodel.setDateEvent,
              ),
              AppGlobalSearchInput<EventTypeModel>(
                displayStringForOption: (EventTypeModel option) =>
                    option.label ?? '',
                helpText: AppLocalizations.of(context)!.event_type,
                hintText: widget.homeViewmodel.localizations.wedding,
                width: 37.w,
                items: widget.homeViewmodel.homeData.value?.eventTypes ?? [],
                onSelected: viewmodel.setTypeEvent,
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
                  onDateSelected: viewmodel.setStarTimeEvent),
              AppGlobalTimePicker(
                helpText: AppLocalizations.of(context)!.end_time,
                hintText: "00:00",
                width: 37.w,
                onDateSelected: viewmodel.setEndTimeEvent,
              ),
            ],
          ),
          const AppGlobalVericalSpacing(),
          AppGlobalSearchInput<int>(
            displayStringForOption: (int option) =>
                '$option ${widget.homeViewmodel.localizations.guests}',
            helpText: AppLocalizations.of(context)!.number_of_guests,
            hintText: "200 ${widget.homeViewmodel.localizations.guests}",
            width: 80.w,
            items: widget.homeViewmodel.homeData.value?.guestNumbers ?? [],
            onSelected: viewmodel.setNumberGuestsEvent,
            keyboardType: TextInputType.number,
          ),
          const AppGlobalVericalSpacing(),
          AppGlobalTextButton(
            minWidth: 80.w,
            textButton: AppLocalizations.of(context)!.search,
            onPressed: viewmodel.searchLocal,
          ),
        ],
      ),
    );
  }
}
