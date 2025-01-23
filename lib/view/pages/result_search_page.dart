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
  final tabs = [
    const Tab(text: 'Todas Ofertas'),
    const Tab(text: 'Mais perto de si'),
    const Tab(text: 'Mais solicitados'),
    const Tab(text: 'Melhores custos e beneficio'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: viewmodel.selectedIndex.value,
      length: tabs.length,
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
            AppGlobalVericalSpacing(
              value: 4.h,
            ),
            _builTabs(
              tabController: _tabController,
              viewmodel: viewmodel,
              tabs: tabs,
            ),
            _buildTabViews(),
          ],
        ),
      ),
    );
  }

  Expanded _buildTabViews() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text('Conteúdo da Tab 1')),
          Center(child: Text('Conteúdo da Tab 2')),
          Center(child: Text('Conteúdo da Tab 3')),
          Center(child: Text('Conteúdo da Tab 4')),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Construção do AppBar
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

class _builTabs extends StatelessWidget {
  const _builTabs({
    super.key,
    required TabController tabController,
    required this.viewmodel,
    required this.tabs,
  }) : _tabController = tabController;

  final TabController _tabController;
  final ResultSearchViewModel viewmodel;
  final List<Tab> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      onTap: viewmodel.selectTab,
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      unselectedLabelColor: primaryBorder,
      labelColor: primary950,
      indicatorColor: primary950,
      tabs: tabs,
    );
  }
}
