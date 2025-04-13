import 'package:tchilla/resources/app_routes.dart';
import 'package:tchilla/viewmodel/interface/isucess_schedule_viewmodel.dart';

class SucessScheduleViewmodel extends ISucessScheduleViewmodel {

  @override
  void goToDetalhes() {
    navigator.navigateToScheduleDetalhes(AppRoutes.sucessSchedulesPage);
  }
}
