import 'package:dio/dio.dart';
import 'package:tchilla/model/welcome_model.dart';
import 'package:tchilla/repository/interfaces/iwelcome_repository.dart';

class WelcomeRepository extends IwelcomeRepository {
  final Dio dio;

  WelcomeRepository({required this.dio});
  @override
  Future<WelcomeModel> fetchWelcomeData(String lang) async {
    try {
      final response = await dio.get("/Resource/welcome?lang=$lang");

      if (response.statusCode == 200 && response.data != null) {
        return WelcomeModel.fromMap(response.data);
      } else {
        throw Exception("Erro ao buscar dados: Código ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Erro inesperado ao buscar dados do welcome. $e");
    }
  }
}
