import 'package:get/get.dart';

class ResultSearchViewModel extends GetxController {
  RxInt selectedIndex = 0.obs;

  void selectTab(int index) {
    selectedIndex.value = index;
  }

}
