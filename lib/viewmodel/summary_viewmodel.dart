import 'package:tchilla/viewmodel/base_viewmodel.dart';

class SummaryViewmodel extends BaseViewModel {
  SummaryViewmodel({
    required super.notificator,
    required super.validator,
    required super.navigator,
    required super.loger,
  });

  void clickContinue(String id) {
    navigator.navigateToTiketPage(id);
  }
}
