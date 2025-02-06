import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tchilla/resources/app_constats.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/angola_price.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_tab_bar.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/shimmer_loading.dart';
import 'package:tchilla/viewmodel/detalhesproposedviewmodel.dart';

class DetalheProposedPage extends StatefulWidget {
  final String id;
  const DetalheProposedPage({
    super.key,
    required this.id,
  });

  @override
  State<DetalheProposedPage> createState() => _DetalheProposedPageState();
}

class _DetalheProposedPageState extends State<DetalheProposedPage>
    with SingleTickerProviderStateMixin {
  final viewmodel = Get.find<DetalheProposedViewModel>();

  late TabController _tabController;

  final List<String> tabTitles = [
    'Sobre',
    ' Serviços',
    'Galeria',
    'Avaliações',
    'Localização',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: viewmodel.selectedIndex.value,
      length: tabTitles.length,
      vsync: this,
    );
    _tabController.addListener(() {
      viewmodel.selectTab(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary50,
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            _buildImageSlide(),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  _buildBody() {
    return Positioned(
      top: 33.h,
      child: Container(
        width: 100.w,
        height: 70.h,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: primary50,
          boxShadow: [
            BoxShadow(color: gray900.withOpacity(.4), blurRadius: 10)
          ],
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.px),
          ),
        ),
        child: AppLayoutpage(
            body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppGlobalVericalSpacing(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppGlobalText(
                  text: "Lindeza Club",
                  style: TextStyleEnum.h2_bold,
                ),
                const AngolaPrice(
                  price: 150000,
                  style: TextStyleEnum.h3_bold,
                )
              ],
            ),
            const AppGlobalVericalSpacing(),
            AppGlobalText(
              text: "Luanda bairro do Hoje ya Henda",
              style: TextStyleEnum.p_medium,
              color: gray500,
            ),
            AppGlobalVericalSpacing(
              value: 1.h,
            ),
            _buildTabs(),
            _buildTabViews(),
            AppGlobalTextButton(
              onPressed: () {},
              textButton: "Agendar",
              minWidth: 100.w,
            ),
            AppGlobalVericalSpacing(
              value: 2.h,
            ),
          ],
        )),
      ),
    );
  }

  Widget _buildTabs() {
    return AppGlobalTabBar(
      tabController: _tabController,
      tabs: tabTitles,
      onTap: viewmodel.selectTab,
      unselectedLabelColor: primaryBorder,
      labelColor: primary950,
      indicatorColor: primary950,
      tabAlignment: TabAlignment.start,
    );
  }

  _buildTabViews() {
    return Container(
      // color: primary400,
      height: 42.h,
      child: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildAboutView(),
          _buildServiceView(),
          _buildGalleryView(),
          _buildReviewsView(),
          _buildLocationView(),
        ],
      ),
    );
  }

  _buildImageSlide() {
    return SizedBox(
      width: 100.w,
      height: 36.h,
      child: Stack(
        children: [
          PageView.builder(
            controller: viewmodel.pageController,
            onPageChanged: (index) => viewmodel.updateCurrentIndex(index),
            itemCount: viewmodel.listImages.length,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                width: 100.w,
                height: 35.h,
                imageUrl: viewmodel.listImages[index],
                placeholder: (context, url) => ShimmerLoading(
                  width: 100.w,
                  height: 35.h,
                ),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: Colors.red),
                fit: BoxFit.cover,
              );
            },
          ),
          _buildBackButton(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: SmoothPageIndicator(
                controller: viewmodel.pageController,
                count: viewmodel.listImages.length,
                effect: ExpandingDotsEffect(
                  dotColor: gray400,
                  activeDotColor: gray50,
                  dotWidth: 2.w,
                  dotHeight: 1.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildBackButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: GestureDetector(
          onTap: viewmodel.goBack,
          child: Container(
            width: 40.px,
            height: 40.px,
            decoration: BoxDecoration(
              color: primary50.withOpacity(.9),
              borderRadius: BorderRadius.circular(50.px),
            ),
            child: Center(
              child: SvgPicture.asset(
                arrowBackSvg,
                width: 25.px,
                height: 25.px,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildAboutView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppGlobalVericalSpacing(
          value: 2.h,
        ),
        AppGlobalText(
          text: "Descrição",
          style: TextStyleEnum.h3_bold,
        ),
        const AppGlobalVericalSpacing(),
        AppGlobalText(
          text:
              "Com apenas alguns cliques, encontre o local ideal para qualquer evento social com as melhores opcoes do mercado eliminando as dores de cabeca na procura",
          style: TextStyleEnum.p_normal,
          maxLines: 50,
          align: TextAlign.start,
          color: gray700,
        ),
        AppGlobalVericalSpacing(
          value: 30.px,
        ),
        AppGlobalText(
          text: "Responsavel",
          style: TextStyleEnum.h3_bold,
        ),
        const AppGlobalVericalSpacing(),
        _buildResponsibleCard(),
      ],
    );
  }

  _buildResponsibleCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipOval(
              child: CachedNetworkImage(
                width: 45.px,
                height: 45.px,
                fit: BoxFit.cover,
                imageUrl:
                    "https://img.freepik.com/free-photo/clueless-unbothered-black-man-shrugging-with-indifferent-look_1258-26279.jpg?t=st=1738253477~exp=1738257077~hmac=2cb8d21e3aab0749da2b048d33b6b5ffe409e5356ab249b7ee43ab009a4da117&w=1060",
              ),
            ),
            const AppGlobalHorizontalSpacing(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppGlobalText(
                  text: "Genilda Neto",
                  style: TextStyleEnum.p_bold,
                ),
                AppGlobalText(
                  text: "Prestadora de Serviço",
                  style: TextStyleEnum.p_normal,
                )
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                ),
                AppGlobalText(
                  text: "4.5",
                  style: TextStyleEnum.p_bold,
                ),
              ],
            ),
            AppGlobalText(
              text: "(450 Avaliações)",
              style: TextStyleEnum.p_normal,
              color: gray700,
            )
          ],
        ),
      ],
    );
  }

  _buildServiceView() {
    final listServices = [
      {"name": "Bufê", "image": bufeImage, "selected": true},
      {"name": "Garçom", "image": garcomImage, "selected": true},
      {"name": "DJ", "image": djImage, "selected": true},
      {"name": "Decoração", "image": decoracoaImage, "selected": false},
      {"name": "Doces e Salgados", "image": doceImage, "selected": true},
      {"name": "Fotógrafo", "image": fotografoImage, "selected": false},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppGlobalVericalSpacing(
          value: 2.h,
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(8.sp),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 1.w,
              mainAxisSpacing: 1.h,
              childAspectRatio: 2,
            ),
            itemCount: listServices.length,
            itemBuilder: (context, index) {
              final service = listServices[index];
              return _buildCardService(service);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCardService(Map<String, dynamic> service) {
    final bool isSelected = service["selected"] as bool;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.sp),
      ),
      color: isSelected ? primary950 : primary50,
      shadowColor: isSelected ? primary950 : primary500,
      child: Row(
        children: [
          SizedBox(width: 2.w),
          SvgPicture.asset(
            service["image"]!,
            placeholderBuilder: (context) =>
                const Icon(Icons.image_not_supported),
          ),
          AppGlobalText(
            text: service["name"]!,
            style: TextStyleEnum.p_bold,
             color: isSelected ? primary50 : primary950,
          ),
        ],
      ),
    );
  }

  _buildGalleryView() {
    return Column(
      children: [
        Center(
            child: Text(
          "Galeria",
        )),
        // Adicione mais conteúdo ou widgets conforme necessário
      ],
    );
  }

  _buildReviewsView() {
    return Column(
      children: [
        Center(
            child: Text(
          "Avaliações",
        )),
        // Adicione mais conteúdo ou widgets conforme necessário
      ],
    );
  }

  _buildLocationView() {
    return Column(
      children: [
        Center(
            child: Text(
          "Localização",
        )),
        // Adicione mais conteúdo ou widgets conforme necessário
      ],
    );
  }
}
