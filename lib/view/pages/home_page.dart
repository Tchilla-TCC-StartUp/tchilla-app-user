import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/resources/app_size.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/pages/view_more_page.dart';
import 'package:tchilla/view/widgets/app_global_network_image.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_tab_bar.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_circular_liner.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/form_local.dart';
import 'package:tchilla/view/widgets/form_local_end_service.dart';
import 'package:tchilla/view/widgets/form_service.dart';
import 'package:tchilla/viewmodel/home_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final FocusNode _locationFocusNode = FocusNode();
  final viewmodel = Get.find<HomeViewModel>();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: viewmodel.selectedIndex.value,
      length: viewmodel.tabTitlesForm.length,
      vsync: this,
    );
    _tabController.addListener(() {
      viewmodel.selectTab(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // statusBarColor: primary950,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            behavior: HitTestBehavior.opaque,
            child: Column(
              children: [
                Obx(
                  () => SizedBox(
                    height: viewmodel.adptiveSilverExpade.value,
                    child: Stack(
                      children: [
                        _buildBackground(),
                        _buildContainerMan(),
                      ],
                    ),
                  ),
                ),
                const AppLayoutpage(
                  body: ViewMorePage(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildBackground() {
    return Column(
      children: [
        SizedBox(
          height: 40.h,
          child: Container(
            width: double.infinity,
            color: primary950,
            child: Stack(
              children: [
                Positioned(
                  top: 5.h,
                  left: 5.w,
                  child: _buildHelloUser(),
                ),
                Positioned(
                  top: 5.h,
                  right: 5.w,
                  child: Transform.scale(
                    scale: 1.w,
                    child: CustomPaint(
                      size: const Size(100, 100),
                      painter: CircleSeriesPainter(
                        circleColor: primary300,
                        spacing: 2,
                        strokeWidth: .1,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 13.h,
                  left: getAdaptativeWidth(6.w, 4.w, 2.w),
                  right: getAdaptativeWidth(6.w, 4.w, 2.w),
                  child: AppGlobalText(
                    text: AppLocalizations.of(context)!.organize_event,
                    style: TextStyleEnum.h2_bold,
                    color: primary50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContainerMan() {
    return Positioned(
      top: 23.h,
      left: getAdaptativeWidth(6.w, 4.w, 2.w),
      right: getAdaptativeWidth(6.w, 4.w, 2.w),
      child: Column(
        children: [
          _buildTabBar(),
          _buildForms(),
        ],
      ),
    );
  }

  _buildTabBar() {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: primary50,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Obx(
        () => AppGlobalTabBar(
          tabController: _tabController,
          tabs: viewmodel.tabTitlesForm.value,
          onTap: viewmodel.selectTab,
          unselectedLabelColor: primaryBorder,
          labelColor: primary950,
          indicatorColor: primary950,
          tabAlignment: TabAlignment.center,
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(
            horizontal: getAdaptativeWidth(9.w, 7.w, 5.w),
          ),
        ),
      ),
    );
  }

  Widget _buildForms() {
    return Container(
      height: viewmodel.adptiveHeight.value,
      decoration: BoxDecoration(
        color: primary50,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: IndexedStack(
          index: _tabController.index,
          children: [
            // Head
            FormLocal(
              locationFocusNode: _locationFocusNode,
              viewmodel: viewmodel,
            ),

            FormService(
              locationFocusNode: _locationFocusNode,
              viewmodel: viewmodel,
            ),
            FormLocalEndService(
              locationFocusNode: _locationFocusNode,
              viewmodel: viewmodel,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHelloUser() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => viewmodel.navigateToProfilePage(),
          child: ClipOval(
            child: AppGlobalNetworkImage(
              image: AppAssetsImages.defaultUserImage,
              width: 40.px,
              height: 40.px,
            ),
          ),
        ),
        const AppGlobalHorizontalSpacing(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.hello,
              style: GoogleFonts.inter(
                color: primary50,
                fontSize: 12.spa,
                fontWeight: FontWeight.w200,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.visitor,
              style: GoogleFonts.inter(
                color: primary50,
                fontSize: 14.spa,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        )
      ],
    );
  }
}
