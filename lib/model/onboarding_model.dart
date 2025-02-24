import 'dart:convert';

class OnboardingModel {
  final String title;
  final String url;
  final String description;

  OnboardingModel({
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

  factory OnboardingModel.fromMap(Map<String, dynamic> map) {
    return OnboardingModel(
      title: map['title'] as String,
      url: map['url'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnboardingModel.fromJson(String source) =>
      OnboardingModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
