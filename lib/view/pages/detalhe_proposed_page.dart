import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/pages/error_try_again.dart';
import 'package:tchilla/view/widgets/angola_price.dart';
import 'package:tchilla/view/widgets/app_global_loading.dart';
import 'package:tchilla/view/widgets/app_global_network_image.dart';
import 'package:tchilla/view/widgets/app_global_page_indicator.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_tab_bar.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/app_responsible_card.dart';
import 'package:tchilla/viewmodel/detalhesproposedviewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  @override
  void initState() {
    super.initState();
    viewmodel.initTabController(this);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
          backgroundColor: primary50,
          body: SizedBox(
            width: Device.width,
            height: Device.height,
            child: Obx(
              () {
                return viewmodel.isLoading.value
                    ? const AppGlobalLoading()
                    : viewmodel.isError.value
                        ? ErrorTryAgain(message: viewmodel.errorMessage.value)
                        : Stack(
                            children: [
                              _buildImageSlide(),
                              _buildBody(),
                            ],
                          );
              },
            ),
          )),
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
              onPressed: () => viewmodel.scheduleProposal("11"),
              textButton: AppLocalizations.of(context)!.schedule,
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
      tabController: viewmodel.tabController.value!,
      tabs: viewmodel.tabTitles,
      onTap: viewmodel.selectTab,
      unselectedLabelColor: primaryBorder,
      labelColor: primary950,
      indicatorColor: primary950,
      tabAlignment: TabAlignment.start,
    );
  }

  _buildTabViews() {
    return SizedBox(
      // color: primary400,
      height: 44.h,
      child: TabBarView(
        controller: viewmodel.tabController.value,
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
              return AppGlobalNetworkImage(
                image: viewmodel.listImages[index],
                width: 100.w,
                height: 35.h,
              );
            },
          ),
          _buildBackButton(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: AppGlobalPageIndicator(
                controller: viewmodel.pageController,
                count: viewmodel.listImages.length,
                dotColor: gray400,
                activeDotColor: gray50,
                dotWidth: 2.w,
                dotHeight: 1.h,
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
                AppAssetsImages.arrowBackSvg,
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
          text: AppLocalizations.of(context)!.description,
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
        AppResponsibleCard(
          name: "Celson Paixão",
          role: "Admin",
          imageUrl: AppAssetsImages.defaultUserImage,
          rating: 4.6,
          reviews: 100,
        )
      ],
    );
  }

  _buildServiceView() {
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
            itemCount: viewmodel.listServices.length,
            itemBuilder: (context, index) {
              final service = viewmodel.listServices[index];
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              service["image"]!,
              width: 24.px,
              height: 24.px,
            ),
            const AppGlobalHorizontalSpacing(),
            AppGlobalText(
              text: service["name"]!,
              style: TextStyleEnum.p_bold,
              color: isSelected ? primary50 : primary950,
            ),
          ],
        ),
      ),
    );
  }

  _buildGalleryView() {
    return GridView.builder(
        padding: const EdgeInsets.all(0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1.w,
          mainAxisSpacing: 1.h,
          childAspectRatio: 1.5,
        ),
        itemCount: viewmodel.galeryImages.length,
        itemBuilder: (context, index) {
          var item = viewmodel.galeryImages[index];

          return Card(
            elevation: 2,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.sp),
            ),
            color: primary600,
            shadowColor: primary600,
            child: AppGlobalNetworkImage(
              image: item,
              width: 60.w,
              height: 15.h,
            ),
          );
        });
  }

  _buildReviewsView() {
    return ListView.builder(
      itemCount: viewmodel.listReviews.length,
      itemBuilder: (context, index) {
        var item = viewmodel.listReviews[index];
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: 275.px,
            height: 110.px,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: primary50,
              borderRadius: BorderRadius.circular(8.px),
              boxShadow: const [
                BoxShadow(
                  color: primary400,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                )
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: AppGlobalNetworkImage(
                        image: item["image"],
                        width: 35.px,
                        height: 35.px,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const AppGlobalHorizontalSpacing(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppGlobalText(
                          text: item["name"],
                          style: TextStyleEnum.review_bold,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                              size: 16,
                            ),
                            AppGlobalText(
                              text: item["rating"].toString(),
                              style: TextStyleEnum.review_bold,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                AppGlobalVericalSpacing(
                  value: 1.h,
                ),
                AppGlobalText(
                  text: item["comment"].toString(),
                  style: TextStyleEnum.review_normal,
                  maxLines: 10,
                  align: TextAlign.start,
                  color: gray700,
                ),
              ],
            ),
          ),
        );
      },
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
