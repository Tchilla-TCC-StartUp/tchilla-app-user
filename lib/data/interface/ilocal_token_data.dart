abstract class IlocalTokenData {
  Future<String?> fetchToken();
  Future<void> saveToken(String token);
  Future<void> updateToken(String token);
  Future<void> deletoken();

}
