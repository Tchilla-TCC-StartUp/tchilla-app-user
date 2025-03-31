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
  });
}
