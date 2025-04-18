import 'package:tchilla/viewmodel/interface/iform_local_end_service_viewmodel.dart';

class FormLocalEndServiceViewmodel extends IFormLocalEndServiceViewmodel {
  @override
  void searchLocalAndService() async {
    if (localEvent.value == null ||
        dateEvent.value == null ||
        typeEvent.value == null ||
        starTimeEvent.value == null ||
        endTimeEvent.value == null ||
        numberGuestsEvent.value == null ||
        serviceEvent.isEmpty) {
      return notificator.showLocalAlert(
        localizations.alert_attention,
        localizations.form_required_fields_message,
      );
    }

    navigator.navigateToResultSearchPage();
  }
}
