import 'package:tchilla/model/service_model.dart';
import 'package:tchilla/resources/app_enums.dart';
class ProposedModel {
  String? id;
  String? image;
  String? name;
  String? location;
  int? suportpersonNumer;
  ProposedStatus? status;
  ProposedType? type;
  String? typeEvent;
  double? price;
  List<ServiceModel>? services;
  DateTime? date;

  ProposedModel({
    this.id,
    this.image,
    this.name,
    this.location,
    this.suportpersonNumer,
    this.status,
    this.type,
    this.typeEvent,
    this.price,
    this.services,
    this.date,
  });

  factory ProposedModel.fromMap(Map<String, dynamic> map) {
    return ProposedModel(
      id: map['id'],
      image: map['image'],
      name: map['name'],
      location: map['location'],
      suportpersonNumer: map['suportpersonNumer'],
      status: ProposedStatus.values
          .firstWhere((e) => e.toString() == 'ProposedStatus.${map['status']}'),
      type: ProposedType.values
          .firstWhere((e) => e.toString() == 'ProposedType.${map['type']}'),
      typeEvent: map['typeEvent'],
      price: map['price'],
      services: map['services'] != null
          ? List<ServiceModel>.from(
              map['services'].map((x) => ServiceModel.fromMap(x)))
          : null,
      date: map['date'] != null ? DateTime.parse(map['date']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'location': location,
      'suportpersonNumer': suportpersonNumer,
      'status': status?.toString().split('.').last,
      'type': type?.toString().split('.').last,
      'typeEvent': typeEvent,
      'price': price,
      'services': services?.map((x) => x.toMap()).toList(),
      'date': date?.toIso8601String(),
    };
  }
}
