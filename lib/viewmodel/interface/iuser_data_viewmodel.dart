import 'package:tchilla/viewmodel/base_viewmodel.dart';

abstract class IUserDataViewmodel extends BaseViewModel {
  void initEvets();
  void toggleEmailEditable();
  void togglePasswordEditable();
  void getUserData();
  void setEmail(String? value);
  void setPassword(String? value);
  void setName(String? value);
  void setPhoneNumer(String? value);
}
