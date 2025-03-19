import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServiceModel {
  final int? id;
  final String? label;

  ServiceModel(this.id, this.label);

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'label': label,
    };
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      map['id'] != null ? map['id'] as int : null,
      map['label'] != null ? map['label'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceModel.fromJson(String source) => ServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
