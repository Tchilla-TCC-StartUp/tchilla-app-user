import 'package:get/get.dart';
import 'package:tchilla/resources/app_routes.dart';
import 'package:tchilla/resources/phone_constants.dart';
import 'package:tchilla/services/events/user_service.dart';
import 'package:tchilla/viewmodel/interface/iuser_data_viewmodel.dart';

class UserDataViewModel extends IUserDataViewmodel {
  final UserService service;
  final RxBool isNameEditable = false.obs;
  final RxBool isEmailEditable = false.obs;
  final RxBool isPasswordEditable = false.obs;
  final RxBool isTelephoneEditable = false.obs;
  final RxString countryCode = ''.obs;
  final Rxn<String?> email = Rxn<String?>();
  final Rxn<String?> password = Rxn<String?>();
  final Rxn<String?> name = Rxn<String?>();
  final Rxn<String?> telefone = Rxn<String?>();

  late String _initialName;
  late String _initialEmail;
  late String _initialTelefone;

  final Rxn<String?> image = Rxn<String?>();
  final RxBool localLoading = false.obs;
  UserDataViewModel({required this.service});

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }


  void toggleNameEditable() {
    isNameEditable.value = !isNameEditable.value;
  }

  void toggleTelephoneEditable() {
    isTelephoneEditable.value = !isTelephoneEditable.value;
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
        localLoading.value = true;
        onRequest(
          event: service.getUserData(token: token),
          onSuccess: (value) {
            email.value = value.email;
            password.value = '*********';
            name.value = value.nome;

            final rawPhone = value.telefone ?? '';
            String localPhone = rawPhone;

            for (final entry in countryCodes.entries) {
              final code = entry.value;
              if (rawPhone.startsWith(code)) {
                localPhone = rawPhone.replaceFirst(code, '');
                break;
              }
            }

            telefone.value = localPhone;
            image.value = value.foto;

            _initialEmail = value.email ?? '';
            _initialName = value.nome ?? '';
            _initialTelefone = localPhone;
          },
          onComplete: () {
            localLoading.value = false;
          },
        );
      },
    );
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

  @override
  void updateUser() async {
    final bool hasChanges = email.value?.trim() != _initialEmail.trim() ||
        name.value?.trim() != _initialName.trim() ||
        telefone.value?.trim() != _initialTelefone.trim();

    if (!hasChanges) {
      this.navigator.navigateToBack();
      return;
    }

    onEvent(
      event: (token) async {
        await onRequest(
          event: service.updateUser(
            email: email.value ?? '',
            name: name.value ?? "",
            telefone: "$countryCode${telefone.value ?? ''}",
            token: token,
          ),
          onSuccess: (data) async {
            showSuccess(data);
            await Future.delayed(const Duration(seconds: 3));
            this.navigator.navigateToHome();
          },
          onError: (error) {
            showError(error);
          },
        );
      },
      checkLogin: true,
    );
  }
}
