class AppConstats {
  // static const String _baseUrl = "http://192.168.165.235:8080/api";
  static const String _baseUrl = "https://ecotrack-udd9.onrender.com/api";
  static const String _keyToken = "user_token";
  static const String _typeToken = "Bearer";

  // static const String _baseUrl =
  //     "https://a1d0-2c0f-f888-a180-2881-9d31-dce8-38ec-33e4.ngrok-free.app/api";

  static String get baseUrl => _baseUrl;
  String get keyToken => _keyToken;
  String get typeToken => _typeToken;
}
