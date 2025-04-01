import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tchilla/model/proposed_model.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

class SchedulesViewmodel extends BaseViewModel {
  final RxList<ProposedModel> _proposeds = <ProposedModel>[].obs;
  RxList<ProposedModel> get proposeds => _proposeds;

  void initEvent() async {
    await chengeLocalData();
  }

  Future<void> chengeLocalData() async {
    String jsonData =
        await rootBundle.loadString('lib/jsons/my_schedules_data_local.json');
    List<dynamic> jsonList = json.decode(jsonData);
    _proposeds.value =
        jsonList.map((item) => ProposedModel.fromMap(item)).toList();
  }
}
