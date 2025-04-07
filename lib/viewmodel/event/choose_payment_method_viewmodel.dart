import 'package:get/get.dart';
import 'package:tchilla/viewmodel/interface/ichoose_payment_method_viewmodel.dart';

class ChoosePaymentMethodViewmodel extends IchoosePaymentMethodViewmodel {
  final RxInt _bodyViewIndex = 0.obs;
  RxInt get bodyViewIndex => _bodyViewIndex;

  @override
  void switchMethod(int index) {
    _bodyViewIndex.value = index;
  }

  @override
  void navigateToBack() {
    if (_bodyViewIndex.value != 0) {
      _bodyViewIndex.value = 0;
      return;
    }

    this.navigator.navigateToBack();
  }

  @override
  void paymentMCX() {
    this.navigator.navigateToTiketPage("11");
  }
}
