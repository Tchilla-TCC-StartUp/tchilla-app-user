import 'package:tchilla/viewmodel/base_forma_viewmodel.dart';

class FormLocalViewmodel extends BaseFormaViewmodel {
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
