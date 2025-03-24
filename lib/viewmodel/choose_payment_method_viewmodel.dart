import 'package:get/get.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

class ChoosePaymentMethodViewmodel extends BaseViewModel {
  final RxInt _bodyViewIndex = 0.obs;
  RxInt get bodyViewIndex => _bodyViewIndex;

  void switchMethod(int index) {
    _bodyViewIndex.value = index;
  }

  void navigateToBack() {
    if (_bodyViewIndex.value != 0) {
      _bodyViewIndex.value = 0;
      return;
    }

    this.navigator.navigateToBack();
  }
}
