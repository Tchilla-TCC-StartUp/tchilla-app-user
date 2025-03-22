import 'package:tchilla/model/user_model.dart';

abstract class IHomeService {
  Future<UserModel> getUserData({required String token});
}
