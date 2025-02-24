import 'dart:convert';

class WelcomeModel {
  final String title;
  final String url;
  final String description;

  WelcomeModel({
    required this.title,
    required this.url,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'url': url,
      'description': description,
    };
  }

  factory WelcomeModel.fromMap(Map<String, dynamic> map) {
    return WelcomeModel(
      title: map['title'] as String,
      url: map['url'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WelcomeModel.fromJson(String source) =>
      WelcomeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
