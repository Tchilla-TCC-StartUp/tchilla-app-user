import 'package:tchilla/viewmodel/base_viewmodel.dart';

abstract class IForgontPasswordViewmodel extends BaseViewModel {
  void confirmPin(String pin);
  Future<void> resetPassword(
    final String previousWalk,
  );
  Future<void> submitEmail();
  void chengeEmail(String? value);


  void setNewPassword(String? value);
  void setOldPassword(String? value);
  void setConfirmNewPassword(String? value);
}
