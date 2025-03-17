import 'dart:convert';

class OnboardingModel {
  final String? title;
  final String? url;
  final String? description;
  OnboardingModel({
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

  factory OnboardingModel.fromMap(Map<String, dynamic> map) {
    return OnboardingModel(
      title: map['title'] != null ? map['title'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnboardingModel.fromJson(String source) =>
      OnboardingModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
