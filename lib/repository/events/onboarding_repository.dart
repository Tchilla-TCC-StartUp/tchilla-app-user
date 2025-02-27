import 'package:dio/dio.dart';
import 'package:tchilla/model/onboarding_model.dart';
import 'package:tchilla/repository/interfaces/ionboarding_repository.dart';

class OnboardingRepository extends IonboardingRepository {
  final Dio dio;

  OnboardingRepository({required this.dio});

  @override
  Future<List<OnboardingModel>> fetchOnboadData(String? lang) async {
    final List<OnboardingModel> onboarding = [];

    try {
      final response = await dio.get("/Resource/onboarding?lang=$lang");
      if (response.statusCode == 200) {
        for (var item in response.data) {
          onboarding.add(OnboardingModel.fromMap(item));
        }
      } else {
        throw Exception("ALguma coisa deu errado ${response.statusMessage}");
      }
    } catch (e) {
      throw Exception("Erro inesperado ao buscar onboarding: ${e.toString()}");
    }

    return onboarding;
  }
}
