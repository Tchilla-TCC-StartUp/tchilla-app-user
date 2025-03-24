import 'package:get/get.dart';
import 'package:tchilla/resources/app_routes.dart';
import 'package:tchilla/services/events/user_service.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

class UserDataViewModel extends BaseViewModel {
  final UserService service;
  final RxBool isNameEditable = false.obs;
  final RxBool isEmailEditable = false.obs;
  final RxBool isPasswordEditable = false.obs;

  final Rxn<String?> email = Rxn<String?>();
  final Rxn<String?> password = Rxn<String?>();
  final Rxn<String?> name = Rxn<String?>();
  final Rxn<String?> telefone = Rxn<String?>();
  final Rxn<String?> image = Rxn<String?>();

  UserDataViewModel({required this.service});

  void initEvets() {
    getUserData();
  }

  void toggleNameEditable() {
    isNameEditable.value = !isNameEditable.value;
  }

  void toggleEmailEditable() {
    isEmailEditable.value = !isEmailEditable.value;
  }

  void togglePasswordEditable() {
    // isPasswordEditable.value = !isPasswordEditable.value;
    this.navigator.navigateToRefefinePasswordPage(AppRoutes.userdataPage);
  }

  void getUserData() async {
    await checkinLogin();
    await onRequest(
      event: service.getUserData(token: token.value),
      onSuccess: (value) {
        email.value = value.email;
        password.value = '*********';
        name.value = value.nome;
        telefone.value = value.telefone;
        image.value = value.foto;
      },
    );
  }

  void setEmail(String? value) {
    setFieldChange(email, value);
    loger.info('Email é $email');
  }

  void setPassword(String? value) {
    setFieldChange(password, value);
    loger.info('Password é $password');
  }

  void setName(String? value) {
    setFieldChange(name, value);
    loger.info('Nome é $name');
  }

  void setPhoneNumer(String? value) {
    setFieldChange(telefone, value);
    loger.info('Telefone é $telefone');
  }
}
