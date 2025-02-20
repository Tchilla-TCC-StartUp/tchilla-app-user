import 'package:tchilla/services/interface/ivalidator.dart';

class Validator extends Ivalidator {
  static final RegExp _emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  @override
  bool validatEmail(String email) {
    return _emailRegex.hasMatch(email);
  }
}
