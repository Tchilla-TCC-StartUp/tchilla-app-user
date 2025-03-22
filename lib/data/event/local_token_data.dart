import 'package:tchilla/data/base_local_data.dart';
import 'package:tchilla/data/interface/ilocal_token_data.dart';

class LocalTokenData extends BaseLocalData implements IlocalTokenData {
  @override
  Future<void> deletoken() {
    return shared.clear();
  }

  @override
  Future<String?> fetchToken() async {
    return shared.getString(appconstats.keyToken);
  }

  @override
  Future<void> saveToken(String token) {
    return shared.setString(
        appconstats.keyToken, "${appconstats.typeToken} $token");
  }

  @override
  Future<void> updateToken(String token) {
    deletoken();
    return shared.setString(appconstats.keyToken, token);
  }
}
