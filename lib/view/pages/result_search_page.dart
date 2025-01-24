import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_constats.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_back_button.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
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

  final int tabCount = 5; // Atualizado para refletir o número de títulos
  final List<String> tabTitles = [
    'Todas Ofertas',
    'Melhores Promoções',
    'Mais perto de si',
    'Mais solicitados',
    'Melhores custos e benefício',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: viewmodel.selectedIndex.value,
      length: tabCount,
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

  Widget _buildTabs() {
    return TabBar(
      controller: _tabController,
      onTap: viewmodel.selectTab,
      isScrollable: true,
      unselectedLabelColor: primaryBorder,
      tabAlignment: TabAlignment.start,
      labelColor: primary950,
      indicatorColor: primary950,
      tabs: List.generate(
        tabCount,
        (index) => Tab(text: tabTitles[index]),
      ),
    );
  }

  Expanded _buildTabViews() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(), // Desativa o scroll
        children: List.generate(
          tabCount,
          (index) {
            if (index == 0) {
              return _builAllProposedSection();
            }
            return _builFilterProposedSection(index + 1);
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
          services: ["Dj", "Decoração"],
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
          services: ["Dj", "Decoração"],
        ),
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      leading: const AppGlobalBackButton(),
      centerTitle: true,
      title: ListTile(
        leading: SvgPicture.asset(
          locationIconoSvg,
          colorFilter: const ColorFilter.mode(
            primaryBorder,
            BlendMode.srcIn,
          ),
          width: 30.px,
          height: 40.px,
        ),
        title: Row(
          children: [
            AppGlobalText(
              text: "Benfica, Zona Verde II",
              style: TextStyleEnum.h3_bold,
              color: primaryBorder,
              align: TextAlign.justify,
            ),
          ],
        ),
        subtitle: AppGlobalText(
          text: "25 Nov 2025",
          style: TextStyleEnum.p_medium,
          color: primaryBorder,
          align: TextAlign.justify,
        ),
      ),
    );
  }
}
