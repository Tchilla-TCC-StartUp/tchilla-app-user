import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchilla/model/event_type_model.dart';
import 'package:tchilla/model/service_model.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

class BaseFormaViewmodel extends BaseViewModel {
  final Rxn<String?> localEvent = Rxn<String?>();
  final Rxn<DateTime?> dateEvent = Rxn<DateTime?>();
  final Rxn<EventTypeModel?> typeEvent = Rxn<EventTypeModel?>();
  final Rxn<TimeOfDay?> starTimeEvent = Rxn<TimeOfDay?>();
  final Rxn<TimeOfDay?> endTimeEvent = Rxn<TimeOfDay?>();
  final Rxn<int?> numberGuestsEvent = Rxn<int?>();
  final List<Rxn<ServiceModel>> serviceEvent = <Rxn<ServiceModel>>[];



  void setLocalEvent(String? value) {
    setFieldChange(localEvent, value);
    loger.info('Local do evento é ${localEvent.value}');
  }

  void setDateEvent(DateTime? value) {
    setFieldChange(dateEvent, value);
    loger.info('Data do evento é ${dateEvent.value}');
  }

  void setTypeEvent(EventTypeModel? value) {
    setFieldChange(typeEvent, value);
    loger.info('Tipo do evento é ${typeEvent.value?.label}');
  }

  void setStarTimeEvent(TimeOfDay? value) {
    setFieldChange(starTimeEvent, value);
    loger.info('Hora de inícío do evento é $starTimeEvent');
  }

  void setEndTimeEvent(TimeOfDay? value) {
    setFieldChange(endTimeEvent, value);
    loger.info('Hora de fim do evento é $endTimeEvent');
  }

  void setNumberGuestsEvent(int? value) {
    setFieldChange(numberGuestsEvent, value);
    loger.info('Número de convidados do evento é ${numberGuestsEvent.value}');
  }


  void setServicesEvent(List<ServiceModel>? value) {
    if (value == null) return;
    final changed = setListFieldChange(serviceEvent, value,
        compareFn: (a, b) => a?.id == b.id);
    if (changed) {
      loger.info('Serviços do evento : ${value.map((e) => e.label).toList()}');
    }
  }


}
