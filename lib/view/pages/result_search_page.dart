import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/pages/error_try_again.dart';
import 'package:tchilla/view/widgets/app_custom_list_card.dart';
import 'package:tchilla/view/widgets/app_global_back_button.dart';
import 'package:tchilla/view/widgets/app_global_loading.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_tab_bar.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/proposed_card.dart';
import 'package:tchilla/viewmodel/result_search_viewmodel.dart';

class ResultSearchPage extends StatefulWidget {
  const ResultSearchPage({super.key});

  @override
  State<ResultSearchPage> createState() => _ResultSearchPageState();
}

class _ResultSearchPageState extends State<ResultSearchPage>
    with SingleTickerProviderStateMixin {
  final ResultSearchViewModel viewmodel = Get.find<ResultSearchViewModel>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: viewmodel.selectedIndex.value,
      length: viewmodel.tabTitles.length,
      vsync: this,
    );
    _tabController.addListener(() {
      viewmodel.selectTab(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: AppLayoutpage(
        body: Column(
          children: [
            AppGlobalVericalSpacing(value: 1.h),
            _buildTabs(),
            _buildTabViews(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _buildTabs() {
    return AppGlobalTabBar(
      tabController: _tabController,
      tabs: viewmodel.tabTitles.value,
      onTap: viewmodel.selectTab,
      unselectedLabelColor: primaryBorder,
      labelColor: primary950,
      indicatorColor: primary950,
      tabAlignment: TabAlignment.start,
    );
  }

  Expanded _buildTabViews() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          viewmodel.tabTitles.length,
          (index) {
            if (index == 0) {
              return Obx(
                () {
                  return viewmodel.isLoading.value
                      ? const AppGlobalLoading()
                      : viewmodel.isError.value
                          ? ErrorTryAgain(message: viewmodel.errorMessage.value)
                          : _builAllProposedSection();
                },
              );
            }
            return Obx(
              () {
                return viewmodel.isLoading.value
                    ? const AppGlobalLoading()
                    : viewmodel.isError.value
                        ? ErrorTryAgain(message: viewmodel.errorMessage.value)
                        : _builFilterProposedSection(index + 1);
              },
            );
          },
        ),
      ),
    );
  }

  _builAllProposedSection() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, itemIndex) => Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: ProposedCard(
          onClick: () => viewmodel.selectProposed("id"),
          services: const ["Dj", "Decoração"],
        ),
      ),
    );
  }

  _builFilterProposedSection(final int count) {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (context, itemIndex) => Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: ProposedCard(
          onClick: () => viewmodel.selectProposed("id"),
          services: const ["Dj", "Decoração"],
        ),
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      leading: const AppGlobalBackButton(),
      centerTitle: true,
      title: AppCustomListCard(
        iconPath: AppAssetsImages.locationIconSvg,
        title: "Benfica, Zona Verde II",
        subtitle: "25 Nov 2025",
      ),
    );
  }
}
