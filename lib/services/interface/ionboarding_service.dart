import 'package:tchilla/model/onboarding_model.dart';

abstract class IonboardingService {
  Future<List<OnboardingModel>> fetchOnboadData(String lang);
}
