import 'package:tchilla/viewmodel/base_viewlmodel.dart';

class SummaryViewmodel extends BaseViewlmodel {
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
