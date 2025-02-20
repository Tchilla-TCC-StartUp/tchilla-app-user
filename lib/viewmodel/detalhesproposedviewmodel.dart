// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tchilla/resources/app_assets_images.dart';

import 'package:tchilla/resources/app_constats.dart';
import 'package:tchilla/services/events/navigation.dart';

class DetalheProposedViewModel extends GetxController {
  final Navigation navigator;
  RxInt selectedIndex = 0.obs;
  RxList<String> tabTitles = [
    'Sobre',
    ' Serviços',
    'Galeria',
    'Avaliações',
    'Localização',
  ].obs;
  final listImages = [
    AppAssetsImages.defaultProposedImage,
    "https://www.quintoandar.com.br/guias/wp-content/uploads/2024/07/salao-de-festas-condominio.webp",
    "https://espacohipica.com.br/wp-content/uploads/2019/02/festa-de-casamento-em-curitiba_locacao-de-espaco-para-eventos-em-curitiba-52.webp"
  ];

  final galeryImages = [
    AppAssetsImages.defaultProposedImage,
    "https://www.quintoandar.com.br/guias/wp-content/uploads/2024/07/salao-de-festas-condominio.webp",
    "https://espacohipica.com.br/wp-content/uploads/2019/02/festa-de-casamento-em-curitiba_locacao-de-espaco-para-eventos-em-curitiba-52.webp",
    AppAssetsImages.defaultProposedImage,
    "https://www.quintoandar.com.br/guias/wp-content/uploads/2024/07/salao-de-festas-condominio.webp",
    "https://espacohipica.com.br/wp-content/uploads/2019/02/festa-de-casamento-em-curitiba_locacao-de-espaco-para-eventos-em-curitiba-52.webp",
  ];

  final listServices = [
    {"name": "Bufê", "image": AppAssetsImages.buffetImage, "selected": true},
    {"name": "Garçom", "image": AppAssetsImages.waiterImage, "selected": true},
    {"name": "DJ", "image": AppAssetsImages.djImage, "selected": true},
    {
      "name": "Decoração",
      "image": AppAssetsImages.decorImage,
      "selected": false
    },
    {
      "name": "Doces e Salgados",
      "image": AppAssetsImages.cakeImage,
      "selected": true
    },
    {
      "name": "Fotógrafo",
      "image": AppAssetsImages.photographerImage,
      "selected": false
    },
  ];
  final List<Map<String, dynamic>> listReviews = [
    {
      "name": "Carlos Silva",
      "image": AppAssetsImages.defaultUserImage,
      "rating": 4.5,
      "comment":
          "Ótimo serviço, os garçons foram muito atenciosos e a comida estava incrível!"
    },
    {
      "name": "Mariana Oliveira",
      "image": AppAssetsImages.defaultUserImage,
      "rating": 5.0,
      "comment":
          "O DJ arrasou na seleção de músicas, e a decoração estava impecável!"
    },
    {
      "name": "João Ferreira",
      "image": AppAssetsImages.defaultUserImage,
      "rating": 3.5,
      "comment":
          "O serviço foi bom, mas houve pequenos atrasos na entrega dos doces."
    },
    {
      "name": "Ana Costa",
      "image": AppAssetsImages.defaultUserImage,
      "rating": 4.0,
      "comment":
          "O fotógrafo capturou momentos incríveis, mas poderia ter mais fotos espontâneas."
    },
    {
      "name": "Ricardo Mendes",
      "image": AppAssetsImages.defaultUserImage,
      "rating": 2.5,
      "comment":
          "O bufê estava saboroso, mas achei que a quantidade de comida poderia ser maior."
    }
  ];

  var currentIndex = 0.obs;
  DetalheProposedViewModel({
    required this.navigator,
  });
  final pageController = PageController();

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }

  goBack() {
    navigator.navigateToBack();
  }

  void selectTab(int index) {
    selectedIndex.value = index;
  }

  selectProposed(String id) {
    navigator.navigateToDetalhesPage(id);
  }
}
