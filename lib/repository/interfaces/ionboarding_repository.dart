import 'package:tchilla/model/onboarding_model.dart';
import 'package:tchilla/repository/base_repository.dart';

abstract class IonboardingRepository extends BaseRepository {
  Future<List<OnboardingModel>>  fetchOnboadData(String lang);
}
