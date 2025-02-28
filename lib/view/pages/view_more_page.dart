import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_loading.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_tab_bar.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/card_more_requested.dart';
import 'package:tchilla/view/widgets/proposed_card.dart';
import 'package:tchilla/viewmodel/view_more_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ViewMorePage extends StatefulWidget {
  const ViewMorePage({super.key});

  @override
  State<ViewMorePage> createState() => _ViewMorePageState();
}

class _ViewMorePageState extends State<ViewMorePage>
    with SingleTickerProviderStateMixin {
  final viewmodel = Get.find<ViewMoreViewmodel>();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: viewmodel.selectedIndex.value,
      length: viewmodel.tabTitlesSegestions.length,
      vsync: this,
    );
    _tabController.addListener(() {
      viewmodel.selectTab(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return viewmodel.isLoading.value
          ? const AppGlobalLoading()
          : viewmodel.buildErrorValidatedView(
              error: viewmodel.isError.value,
              message: viewmodel.errorMessage.value,
              tryAgainEvet: ([p0]) {},
              view: _buildBody(context),
            );
    });
  }

  Column _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppGlobalVericalSpacing(value: 2.h),
        AppGlobalText(
          text: AppLocalizations.of(context)!.most_requested,
          style: TextStyleEnum.h3_bold,
        ),
        AppGlobalVericalSpacing(value: 2.h),
        SizedBox(
          height: 34.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding:
                  const EdgeInsets.only(right: 3, top: 8, bottom: 8, left: 5),
              child: CardMoreRequested(
                onClick: () => viewmodel.selectProposed("id"),
                services: const [
                  "Dj",
                  "Decoração",
                  "Decoração",
                  "Decoração",
                ],
              ),
            ),
            separatorBuilder: (context, index) => AppGlobalHorizontalSpacing(
              value: 20.px,
            ),
            itemCount: 5,
          ),
        ),
        AppGlobalVericalSpacing(value: 2.h),
        AppGlobalText(
          text: AppLocalizations.of(context)!.house_suggestions,
          style: TextStyleEnum.h3_bold,
        ),
        AppGlobalVericalSpacing(value: 1.h),
        Obx(
          () => AppGlobalTabBar(
            tabController: _tabController,
            tabs: viewmodel.tabTitlesSegestions.value,
            onTap: viewmodel.selectTab,
            unselectedLabelColor: primaryBorder,
            labelColor: primary950,
            indicatorColor: primary950,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
          ),
        ),
        SizedBox(
          height: 90.h,
          child: _buildTabViews(),
        )
      ],
    );
  }

  _builFilterProposedSection(final int count) {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (context, itemIndex) => Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: ProposedCard(
          onClick: () => viewmodel.selectProposed("id"),
          services: ["Dj", "Decoração"],
        ),
      ),
    );
  }

  _buildTabViews() {
    return TabBarView(
      controller: _tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        viewmodel.tabTitlesSegestions.length,
        (index) {
          return _builFilterProposedSection(index + 2);
        },
      ),
    );
  }
}
