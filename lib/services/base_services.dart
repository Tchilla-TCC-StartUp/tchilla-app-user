import 'package:get/get.dart';
import 'package:tchilla/repository/events/onboarding_repository.dart';
import 'package:tchilla/repository/events/user_repository.dart';
import 'package:tchilla/repository/events/welcome_repository.dart';

class BaseServices {
  final UserRepository userRepository = Get.find();
  final OnboardingRepository onboardingRepository = Get.find();
  final WelcomeRepository welcomeRepository = Get.find();

}
