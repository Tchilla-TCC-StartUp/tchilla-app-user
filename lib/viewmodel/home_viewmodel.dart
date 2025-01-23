import 'package:get/get.dart';
import 'package:tchilla/util/events/navigation.dart';

class HomeViewModel extends GetxController {
  final _navigator = Get.find<Navigation>();

  Future<void> navigateToResultSearchPage() {
    return _navigator.navigateToResultSearchPage();
  }
}
