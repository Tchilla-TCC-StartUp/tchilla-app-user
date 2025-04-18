import 'package:tchilla/model/onboarding_model.dart';
import 'package:tchilla/services/base_services.dart';

abstract class IonboardingService extends BaseServices {
  Future<List<OnboardingModel>> fetchOnboadData(String lang);
}
