import 'package:flutter_modular/flutter_modular.dart';
import 'package:tchilla/util/events/navigation.dart';

class ForengePasswordViewmodel {
  final _navigation = Modular.get<Navigation>();

  Future<void> navigateToToConfirmationPage() {
    return _navigation.navigateToConfirmationPage();
  }
}
