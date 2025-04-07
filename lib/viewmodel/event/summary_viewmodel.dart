import 'package:tchilla/viewmodel/base_viewmodel.dart';
import 'package:tchilla/viewmodel/interface/isummary_viewmodel.dart';

class SummaryViewmodel extends ISummaryViewmodel{


  @override
  void clickContinue(String id) {
    navigator.navigateToChoosePaymentPage();
  }
}
