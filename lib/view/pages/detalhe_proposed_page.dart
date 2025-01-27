import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tchilla/resources/app_constats.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_back_button.dart';
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

class _DetalheProposedPageState extends State<DetalheProposedPage> {
  final viewModel = Get.find<DetalheProposedViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildPageView(),
          _buildBody(),
        ],
      ),
    );
  }

  _buildBody() {
    return Positioned(
      top: 33.h,
      child: Container(
        width: 100.w,
        height: 65.h,
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
      ),
    );
  }

  Widget _buildPageView() {
    return SizedBox(
      width: 100.w,
      height: 35.h,
      child: Stack(
        children: [
          PageView.builder(
            controller: viewModel.pageController,
            onPageChanged: (index) => viewModel.updateCurrentIndex(index),
            itemCount: viewModel.listImages.length,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                width: 100.w,
                height: 35.h,
                imageUrl: viewModel.listImages[index],
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
              padding: EdgeInsets.only(bottom: 3.h),
              child: SmoothPageIndicator(
                controller: viewModel.pageController,
                count: viewModel.listImages.length,
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
          onTap: viewModel.goBack,
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
}
