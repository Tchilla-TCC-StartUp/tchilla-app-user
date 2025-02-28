import 'package:tchilla/model/welcome_model.dart';
import 'package:tchilla/repository/base_repository.dart';
import 'package:tchilla/repository/interfaces/iwelcome_repository.dart';

class WelcomeRepository extends BaseRepository implements IwelcomeRepository {
  WelcomeRepository({
    required super.dio,
    required super.navigator,
    required super.notificator,
  });

  @override
  Future<WelcomeModel> fetchWelcomeData(String lang) async {
    late WelcomeModel welcome;
    try {
      final response = await dio.get("/Resource/welcome?lang=$lang");

      if (response.statusCode == 200) {
        welcome = WelcomeModel.fromMap(response.data);
      } else {
        notificator.showLocalError(
          response.statusCode.toString(),
          response.statusMessage.toString(),
        );
      }
    } catch (e) {
      throw Exception(e);
    }

    return welcome;
  }
}
