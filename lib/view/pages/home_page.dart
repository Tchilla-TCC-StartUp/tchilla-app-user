import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_size.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_data_picker.dart';
import 'package:tchilla/view/widgets/app_global_dropdown_menu.dart';
import 'package:tchilla/view/widgets/app_global_input.dart';
import 'package:tchilla/view/widgets/app_global_service_tags_manager.dart';
import 'package:tchilla/view/widgets/app_global_show_and_hide_animation.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_circular_liner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusNode _locationFocusNode = FocusNode();

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
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: <Widget>[
                _buildBackground(),
                _buildContainerMan(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildContainerMan() {
    return Positioned(
      top: 25.h,
      left: getAdaptativeWidth(7.w, 5.w, 3.w),
      right: getAdaptativeWidth(7.w, 5.w, 3.w),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
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
          clipBehavior: Clip.none,
          margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Form(
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
              AppGlobalShowAndHideAnimation(
                focusNode: [_locationFocusNode],
                children: [
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
                      DropdownMenuEntry(
                          value: "Confeiteiro", label: "Confeiteiro"),
                      DropdownMenuEntry(value: "Bartender", label: "Bartender"),
                    ],
                    // Exemplo de valor inicial
                    onChanged: (selectedTags) {
                      print("Tags Selecionadas: $selectedTags");
                    },
                  ),
                ],
              ),
              AppGlobalTextButton(
                minWidth: 80.w,
                textButton: "Pesquisar",
                onPressed: () {},
              ),
            ],
          )),
        ),
      ),
    );
  }

  _buildBackground() {
    return Column(
      children: [
        Expanded(
          flex: 4,
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
                  top: 15.h,
                  left: getAdaptativeWidth(8.w, 6.w, 4.w),
                  right: getAdaptativeWidth(8.w, 6.w, 4.w),
                  child: AppGlobalText(
                    text: "Organize seu evento\nem questão de minutos ",
                    style: TextStyleEnum.h2_bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 6, // Flexível, ocupa 60% da tela
          child: Container(
            width: double.infinity,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  _buildHelloUser() {
    return Row(
      children: [
        const CircleAvatar(
          child: Icon(Icons.person),
        ),
        const AppGlobalHorizontalSpacing(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Olá👋",
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 13.spa,
                fontWeight: FontWeight.w200,
              ),
            ),
            Text(
              "Sr(a) Visitante",
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15.spa,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        )
      ],
    );
  }
}
