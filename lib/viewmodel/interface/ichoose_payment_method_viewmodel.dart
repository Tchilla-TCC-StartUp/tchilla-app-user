import 'package:tchilla/viewmodel/base_viewmodel.dart';

abstract class IchoosePaymentMethodViewmodel extends BaseViewModel {
  void switchMethod(int index);
  void navigateToBack();
  void paymentMCX();
}
