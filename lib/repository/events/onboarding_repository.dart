import 'package:tchilla/model/onboarding_model.dart';
import 'package:tchilla/repository/base_repository.dart';
import 'package:tchilla/repository/interfaces/ionboarding_repository.dart';


class OnboardingRepository extends BaseRepository
    implements IonboardingRepository {


  @override
  Future<List<OnboardingModel>> fetchOnboadData(String? lang) async {
    final response =
        await get<List<dynamic>>("/Resource/onboarding?lang=$lang");
    return response.map((item) => OnboardingModel.fromMap(item)).toList();
  }
}
