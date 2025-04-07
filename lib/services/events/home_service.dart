import 'package:tchilla/model/user_model.dart';
import 'package:tchilla/services/base_services.dart';
import 'package:tchilla/services/interface/ihome_service.dart';

class HomeService extends IHomeService {

  @override
  Future<UserModel> getUserData({required String token}) async {
    return userRepository.getUserData(token: token);
  }
}
