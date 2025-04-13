import 'package:tchilla/resources/app_routes.dart';
import 'package:tchilla/viewmodel/event/ischedules_detalhe_viewmodel.dart';

class ScheduleDetalheViewmodel extends ISchedulesDetalheViewmodel {
  @override
  void goBack(String lastRouter) {
    if (lastRouter == AppRoutes.sucessSchedulesPage) {
      navigator.navigateToHome();
      return;
    }

    navigator.navigateToBack();
  }
}
