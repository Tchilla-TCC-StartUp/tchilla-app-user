import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_size.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_tab_bar.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/card_more_requested.dart';
import 'package:tchilla/view/widgets/proposed_card.dart';
import 'package:tchilla/viewmodel/view_more_viewmodel.dart';

class ViewMorePage extends StatefulWidget {
  const ViewMorePage({super.key});

  @override
  State<ViewMorePage> createState() => _ViewMorePageState();
}

class _ViewMorePageState extends State<ViewMorePage>
    with SingleTickerProviderStateMixin {
  final viewmodel = Get.find<ViewMoreViewmodel>();

  late TabController _tabController;

  final List<String> tabTitlesSegestions = [
    "Casamento",
    "Pedido",
    "Noivado",
    "Aniversario",
    "Corporativos",
    "Religos",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: viewmodel.selectedIndex.value,
      length: tabTitlesSegestions.length,
      vsync: this,
    );
    _tabController.addListener(() {
      viewmodel.selectTab(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppGlobalVericalSpacing(value: 2.h),
        AppGlobalText(
          text: "Mais solicitados",
          style: TextStyleEnum.h3_bold,
        ),
        AppGlobalVericalSpacing(value: 2.h),
        SizedBox(
          height: 34.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 3, top: 8, bottom: 8, left: 5),
              child: CardMoreRequested(
                onClick: () => viewmodel.selectProposed("id"),
                services: [
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
          text: "Sugestões da Casa",
          style: TextStyleEnum.h3_bold,
        ),
        AppGlobalVericalSpacing(value: 1.h),
        AppGlobalTabBar(
          tabController: _tabController,
          tabs: tabTitlesSegestions,
          onTap: viewmodel.selectTab,
          unselectedLabelColor: primaryBorder,
          labelColor: primary950,
          indicatorColor: primary950,
          tabAlignment: TabAlignment.start,
          isScrollable: true,
        ),
        SizedBox(
          height: 56.h,
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
        tabTitlesSegestions.length,
        (index) {
          return _builFilterProposedSection(index + 1);
        },
      ),
    );
  }
}
