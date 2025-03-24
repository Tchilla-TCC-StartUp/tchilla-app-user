import 'package:tchilla/model/onboarding_model.dart';
import 'package:tchilla/services/base_services.dart';
import 'package:tchilla/services/interface/ionboarding_service.dart';

class OnboardingService extends BaseServices implements IonboardingService {
  @override
  Future<List<OnboardingModel>> fetchOnboadData(String lang) {
    return onboardingRepository.fetchOnboadData(lang);
  }
}
