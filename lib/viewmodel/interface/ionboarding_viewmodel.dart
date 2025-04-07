import 'package:tchilla/viewmodel/base_viewmodel.dart';

abstract class IOnboardingViewmodel extends BaseViewModel {
  void getOnboarding();
  void nextPage();
  void clickSkip();
}
