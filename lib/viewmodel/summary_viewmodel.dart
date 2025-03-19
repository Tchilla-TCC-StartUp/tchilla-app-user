import 'package:tchilla/viewmodel/base_viewmodel.dart';

class SummaryViewmodel extends BaseViewModel {


  void clickContinue(String id) {
    navigator.navigateToChoosePaymentPage();
  }
}
