import 'package:tchilla/viewmodel/interface/iform_local_viewmodel.dart';

class FormLocalViewmodel extends IFormLocalViewmodel {
  @override
  void searchLocal() async {
    if (localEvent.value == null ||
        dateEvent.value == null ||
        typeEvent.value == null ||
        starTimeEvent.value == null ||
        endTimeEvent.value == null ||
        numberGuestsEvent.value == null) {
      return notificator.showLocalAlert(
        localizations.alert_attention,
        localizations.form_required_fields_message,
      );
    }

    navigator.navigateToResultSearchPage();
  }
}
