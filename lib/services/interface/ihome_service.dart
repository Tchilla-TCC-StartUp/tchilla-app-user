import 'package:tchilla/model/user_model.dart';
import 'package:tchilla/services/base_services.dart';

abstract class IHomeService extends BaseServices {
  Future<UserModel> getUserData({required String token});
}
