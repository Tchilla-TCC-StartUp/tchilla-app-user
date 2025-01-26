import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tchilla/resources/app_constats.dart';
import 'package:tchilla/util/events/navigation.dart';

class DetalheProposedViewModel extends GetxController {
  final _navigator = Get.find<Navigation>();
  final listImages = [
    defultProposedImage,
    "https://www.quintoandar.com.br/guias/wp-content/uploads/2024/07/salao-de-festas-condominio.webp",
    "https://espacohipica.com.br/wp-content/uploads/2019/02/festa-de-casamento-em-curitiba_locacao-de-espaco-para-eventos-em-curitiba-52.webp"
  ];

  var currentIndex = 0.obs;
  final pageController = PageController();

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }

  goBack() {
    _navigator.navigateToBack();
  }
}
