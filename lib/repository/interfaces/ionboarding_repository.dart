import 'package:tchilla/model/onboarding_model.dart';

abstract class IonboardingRepository {
  Future<List<OnboardingModel>>  fetchOnboadData(String lang);
}
