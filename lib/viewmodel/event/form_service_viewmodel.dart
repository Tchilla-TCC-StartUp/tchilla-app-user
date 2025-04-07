
import 'package:tchilla/viewmodel/interface/iform_service_viewmodel.dart';


class FormServiceViewmodel extends IFormServiceViewmodel {
  @override
  void searchService() async {
    if (localEvent.value == null ||
        dateEvent.value == null ||
        typeEvent.value == null ||
        starTimeEvent.value == null ||
        endTimeEvent.value == null ||
        numberGuestsEvent.value == null ||
        serviceEvent.isEmpty) {
      return notificator.showLocalAlert(
          localizations.alert_attention, localizations.login_required_fields);
    }

    navigator.navigateToResultSearchPage();
  }
}
