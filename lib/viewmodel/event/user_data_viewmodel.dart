import 'package:get/get.dart';
import 'package:tchilla/resources/app_routes.dart';
import 'package:tchilla/services/events/user_service.dart';
import 'package:tchilla/viewmodel/interface/iuser_data_viewmodel.dart';

class UserDataViewModel extends IUserDataViewmodel {
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

  @override
  void initEvets() {
    getUserData();
  }

  void toggleNameEditable() {
    isNameEditable.value = !isNameEditable.value;
  }

  @override
  void toggleEmailEditable() {
    isEmailEditable.value = !isEmailEditable.value;
  }

  @override
  void togglePasswordEditable() {
    // isPasswordEditable.value = !isPasswordEditable.value;
    this.navigator.navigateToRefefinePasswordPage(AppRoutes.userdataPage);
  }

  @override
  void getUserData() async {
    await onEvent(
        checkLogin: true,
        event: (token) async {
      onRequest(
        event: service.getUserData(token: token),
        onSuccess: (value) {
          email.value = value.email;
          password.value = '*********';
          name.value = value.nome;
          telefone.value = value.telefone;
          image.value = value.foto;
        },
      );
    });
  }

  @override
  void setEmail(String? value) {
    setFieldChange(email, value);
    loger.info('Email é $email');
  }

  @override
  void setPassword(String? value) {
    setFieldChange(password, value);
    loger.info('Password é $password');
  }

  @override
  void setName(String? value) {
    setFieldChange(name, value);
    loger.info('Nome é $name');
  }

  @override
  void setPhoneNumer(String? value) {
    setFieldChange(telefone, value);
    loger.info('Telefone é $telefone');
  }
}
