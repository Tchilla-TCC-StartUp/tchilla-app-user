import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_constats.dart';
import 'package:tchilla/resources/app_size.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_data_picker.dart';
import 'package:tchilla/view/widgets/app_global_dropdown_menu.dart';
import 'package:tchilla/view/widgets/app_global_input.dart';
import 'package:tchilla/view/widgets/app_global_service_tags_manager.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_circular_liner.dart';
import 'package:tchilla/view/widgets/card_more_requested.dart';
import 'package:tchilla/viewmodel/home_viewmodel.dart';

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

  final List<String> tabTitles = ["Local", "Serviços", "Local+\nServiços"];

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          behavior: HitTestBehavior.opaque,
          child: CustomScrollView(
            slivers: [
              _buildSliverAppBar(),
              _buildSliverContainerMan(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return Obx(
      () => SliverAppBar(
        expandedHeight: viewmodel.adptiveSilverExpade.value,
        pinned: true,
        floating: false,
        backgroundColor: primary50,
        flexibleSpace: FlexibleSpaceBar(
          background: Stack(
            children: [
              _buildBackground(),
              _buildContainerMan(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSliverContainerMan() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: _buildMoreRequested(),
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
                  left: getAdaptativeWidth(8.w, 6.w, 4.w),
                  right: getAdaptativeWidth(8.w, 6.w, 4.w),
                  child: AppGlobalText(
                    text: "Organize seu evento\nem questão de minutos",
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
      left: getAdaptativeWidth(7.w, 5.w, 3.w),
      right: getAdaptativeWidth(7.w, 5.w, 3.w),
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
        color: primary100,
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
      child: TabBar(
        controller: _tabController,
        onTap: viewmodel.selectTab,
        unselectedLabelColor: primaryBorder,
        tabAlignment: TabAlignment.fill,
        labelColor: primary50,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: primary50,
          // borderRadius: BorderRadius.only(
          //   bottomRight: Radius.circular(20),
          //   topLeft: Radius.circular(20)
          // ),
          boxShadow: [
            BoxShadow(
              color: primary950.withOpacity(.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        tabs: List.generate(
          tabTitles.length,
          (index) => Tab(
            child: AppGlobalText(
              text: tabTitles[index],
              style: TextStyleEnum.p_bold,
              align: TextAlign.center,
            ),
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
            _buildFormLocal(),
            _buildFormService(),
            _buildFormLocalEndService(),
          ],
        ),
      ),
    );
  }

  _buildMoreRequested() {
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
              padding: const EdgeInsets.all(8.0),
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
      ],
    );
  }

  _buildFormLocal() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppGlobalInput(
            helpText: "Local Evento",
            hintText: "EX: provincia/municipio/bairro",
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            focusNode: _locationFocusNode,
          ),
          AppGlobalVericalSpacing(
            value: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppGlobalDatePicker(
                helpText: "Data do Evento",
                hintText: "25 NOV 2025",
                width: 37.w,
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
                onDateSelected: (DateTime date) {
                  print("Data selecionada: $date");
                },
              ),
              AppGlobalDropdownMenu(
                helpText: "Tipo Evento",
                hintText: "Casamento",
                width: 37.w,
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: "OP1", label: "Casamento"),
                  DropdownMenuEntry(value: "OP1", label: "Pedido"),
                  DropdownMenuEntry(value: "OP1", label: "Aniversário"),
                  DropdownMenuEntry(value: "OP1", label: "Noivado"),
                ],
              ),
            ],
          ),
          AppGlobalVericalSpacing(
            value: 2.h,
          ),
          AppGlobalDropdownMenu(
            helpText: "N de Convidados",
            hintText: "150 Convidados",
            width: 80.w,
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: "OP1", label: "150 Convidados"),
              DropdownMenuEntry(value: "OP1", label: "300 Convidadoso"),
              DropdownMenuEntry(value: "OP1", label: "600 Convidados"),
              DropdownMenuEntry(value: "OP1", label: "1200 Convidados"),
            ],
          ),
          AppGlobalVericalSpacing(
            value: 4.h,
          ),
          AppGlobalTextButton(
            minWidth: 80.w,
            textButton: "Pesquisar",
            onPressed: viewmodel.navigateToResultSearchPage,
          ),

          // HomeIndicatorBanner()
        ],
      ),
    );
  }

  _buildFormLocalEndService() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppGlobalInput(
            helpText: "Local Evento",
            hintText: "EX: provincia/municipio/bairro",
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            focusNode: _locationFocusNode,
          ),
          AppGlobalVericalSpacing(
            value: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppGlobalDatePicker(
                helpText: "Data do Evento",
                hintText: "25 NOV 2025",
                width: 37.w,
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
                onDateSelected: (DateTime date) {
                  print("Data selecionada: $date");
                },
              ),
              AppGlobalDropdownMenu(
                helpText: "Tipo Evento",
                hintText: "Casamento",
                width: 37.w,
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: "OP1", label: "Casamento"),
                  DropdownMenuEntry(value: "OP1", label: "Pedido"),
                  DropdownMenuEntry(value: "OP1", label: "Aniversário"),
                  DropdownMenuEntry(value: "OP1", label: "Noivado"),
                ],
              ),
            ],
          ),
          AppGlobalVericalSpacing(
            value: 2.h,
          ),
          AppGlobalDropdownMenu(
            helpText: "N de Convidados",
            hintText: "150 Convidados",
            width: 80.w,
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: "OP1", label: "150 Convidados"),
              DropdownMenuEntry(value: "OP1", label: "300 Convidadoso"),
              DropdownMenuEntry(value: "OP1", label: "600 Convidados"),
              DropdownMenuEntry(value: "OP1", label: "1200 Convidados"),
            ],
          ),
          AppGlobalVericalSpacing(
            value: 2.h,
          ),
          AppGlobalServiceTagsManager(
            helpText: "Adicionar Serviço",
            hintText: "Selecione um serviço",
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: "Decoracao", label: "Decoração"),
              DropdownMenuEntry(value: "DJ", label: "DJ"),
              DropdownMenuEntry(value: "Confeiteiro", label: "Confeiteiro"),
              DropdownMenuEntry(value: "Bartender", label: "Bartender"),
            ],
            onChanged: (selectedTags) {
              print("Tags Selecionadas: $selectedTags");
            },
          ),
          AppGlobalTextButton(
            minWidth: 80.w,
            textButton: "Pesquisar",
            onPressed: viewmodel.navigateToResultSearchPage,
          ),
        ],
      ),
    );
  }

  _buildFormService() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppGlobalInput(
            helpText: "Local Evento",
            hintText: "EX: provincia/municipio/bairro",
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            focusNode: _locationFocusNode,
          ),
          AppGlobalVericalSpacing(
            value: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppGlobalDatePicker(
                helpText: "Data do Evento",
                hintText: "25 NOV 2025",
                width: 37.w,
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
                onDateSelected: (DateTime date) {
                  print("Data selecionada: $date");
                },
              ),
              AppGlobalDropdownMenu(
                helpText: "Tipo Evento",
                hintText: "Casamento",
                width: 37.w,
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: "OP1", label: "Casamento"),
                  DropdownMenuEntry(value: "OP1", label: "Pedido"),
                  DropdownMenuEntry(value: "OP1", label: "Aniversário"),
                  DropdownMenuEntry(value: "OP1", label: "Noivado"),
                ],
              ),
            ],
          ),
          AppGlobalVericalSpacing(
            value: 2.h,
          ),
          AppGlobalDropdownMenu(
            helpText: "N de Convidados",
            hintText: "150 Convidados",
            width: 80.w,
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: "OP1", label: "150 Convidados"),
              DropdownMenuEntry(value: "OP1", label: "300 Convidadoso"),
              DropdownMenuEntry(value: "OP1", label: "600 Convidados"),
              DropdownMenuEntry(value: "OP1", label: "1200 Convidados"),
            ],
          ),
          AppGlobalVericalSpacing(
            value: 2.h,
          ),
          AppGlobalDropdownMenu(
            helpText: "Adicionar Serviço",
            hintText: "Selecione um serviço",
            width: 80.w,
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: "Decoracao", label: "Decoração"),
              DropdownMenuEntry(value: "DJ", label: "DJ"),
              DropdownMenuEntry(value: "Confeiteiro", label: "Confeiteiro"),
              DropdownMenuEntry(value: "Bartender", label: "Bartender"),
            ],
          ),
          AppGlobalVericalSpacing(
            value: 2.h,
          ),
          AppGlobalTextButton(
            minWidth: 80.w,
            textButton: "Pesquisar",
            onPressed: viewmodel.navigateToResultSearchPage,
          ),
        ],
      ),
    );
  }

  Widget _buildHelloUser() {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage(userImageDefult),
          backgroundColor: primary50,
        ),
        const AppGlobalHorizontalSpacing(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Olá👋",
              style: GoogleFonts.inter(
                color: primary50,
                fontSize: 12.spa,
                fontWeight: FontWeight.w200,
              ),
            ),
            Text(
              "Sr(a) Visitante",
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
