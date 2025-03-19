import 'dart:convert';

class WelcomeModel {
  final String? title;
  final String? url;
  final String? description;
  WelcomeModel({
    this.title,
    this.url,
    this.description,
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
      title: map['title'] != null ? map['title'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WelcomeModel.fromJson(String source) => WelcomeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
