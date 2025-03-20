// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EventTypeModel {
  final int? id;
  final String? label;

  EventTypeModel(this.id, this.label);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'label': label,
    };
  }

  factory EventTypeModel.fromMap(Map<String, dynamic> map) {
    return EventTypeModel(
      map['id'] != null ? map['id'] as int : null,
      map['label'] != null ? map['label'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventTypeModel.fromJson(String source) =>
      EventTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
