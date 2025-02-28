import 'package:tchilla/model/onboarding_model.dart';
import 'package:tchilla/repository/base_repository.dart';
import 'package:tchilla/repository/interfaces/ionboarding_repository.dart';

class OnboardingRepository extends BaseRepository
    implements IonboardingRepository {
  OnboardingRepository({
    required super.dio,
    required super.navigator,
    required super.notificator,
  });

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
        notificator.showLocalError(
          response.statusCode.toString(),
          response.statusMessage.toString(),
        );
      }
    } catch (e) {
      throw Exception("Erro inesperado ao buscar onboarding: ${e.toString()}");
    }

    return onboarding;
  }
}
