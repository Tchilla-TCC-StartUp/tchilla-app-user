import 'package:tchilla/model/welcome_model.dart';
import 'package:tchilla/repository/base_repository.dart';

abstract class IwelcomeRepository extends BaseRepository {
  Future<WelcomeModel> fetchWelcomeData(String lang);
}
