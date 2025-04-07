import 'package:tchilla/viewmodel/base_viewmodel.dart';

abstract class IForgontPasswordViewmodel extends BaseViewModel {
  void confirmPin(String pin);
  Future<void> resetPassword(
    String password,
    String confirmPassword,
    final String previousWalk,
  );
  Future<void> submitEmail();
  void chengeEmail(String? value);
}
