import 'package:tchilla/model/review_model.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

abstract class ISchedulesDetalheViewmodel extends BaseViewModel {
  void goBack(String lastRouter);
  void getUserData();
  void setReview();
  void setMessage(String? value);
}
