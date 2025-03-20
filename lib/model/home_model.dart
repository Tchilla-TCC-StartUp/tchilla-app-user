// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:tchilla/model/event_type_model.dart';
import 'package:tchilla/model/service_model.dart';

class HomeModel {
  final String? userName;
  final List<int>? guestNumbers;
  final List<EventTypeModel>? eventTypes;
  final List<ServiceModel>? services;

  HomeModel({
    this.userName,
    this.guestNumbers,
    this.eventTypes,
    this.services,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_name': userName,
      'guest_numbers': guestNumbers,
      'event_types': eventTypes?.map((x) => x.toMap()).toList(),
      'services': services?.map((x) => x.toMap()).toList(),
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      userName: map['user_name'] != null ? map['user_name'] as String : null,
      guestNumbers: map['guest_numbers'] != null
          ? List<int>.from(map['guest_numbers'] as List)
          : null,
      eventTypes: map['event_types'] != null
          ? List<EventTypeModel>.from(
              (map['event_ypes'] as List).map(
                (x) => EventTypeModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      services: map['services'] != null
          ? List<ServiceModel>.from(
              (map['services'] as List).map(
                (x) => ServiceModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeModel.fromJson(String source) =>
      HomeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
