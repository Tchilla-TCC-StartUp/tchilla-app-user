import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_constats.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/util/events/navigation.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/profile_section_card.dart';

class ProfilePage extends StatefulWidget {
  final String id;
  const ProfilePage({super.key, required this.id});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          leadingWidth: 0,
          leading: const SizedBox.shrink(),
          centerTitle: true,
          title: _buildAppbar(),
        ),
        body: AppLayoutpage(
            body: Column(
          children: [
            const ProfileSectionCard(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  userImageDefult,
                ),
                backgroundColor: primary50,
              ),
              title: "Celson Paixão",
            ),
            ProfileSectionCard(
              leading: SvgPicture.asset(
                listIconSvg,
                colorFilter: const ColorFilter.mode(
                  primary900,
                  BlendMode.srcIn,
                ),
              ),
              title: "Meus Agendamentos",
            ),
            ProfileSectionCard(
              leading: SvgPicture.asset(
                notificationIconSvg,
                colorFilter: const ColorFilter.mode(
                  primary900,
                  BlendMode.srcIn,
                ),
              ),
              title: "Notificacoes",
            ),
            const Divider(
              color: primary200,
            ),
            _builPreferences(),
            const Divider(
              color: primary200,
            ),
            _buildSuporte(),
            _buidLogoutButton()
          ],
        )),
      ),
    );
  }

  _buildSuporte() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppGlobalText(
          text: "Suporte",
          style: TextStyleEnum.h3_bold,
        ),
        const AppGlobalVericalSpacing(),
        ProfileSectionCard(
          leading: SvgPicture.asset(
            notepadIconSvg,
            colorFilter: const ColorFilter.mode(
              primary900,
              BlendMode.srcIn,
            ),
          ),
          title: "Centro de apoio",
        ),
        ProfileSectionCard(
          leading: SvgPicture.asset(
            questionIconSvg,
            colorFilter: const ColorFilter.mode(
              primary900,
              BlendMode.srcIn,
            ),
          ),
          title: "FAQs",
        ),
      ],
    );
  }

  _builPreferences() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppGlobalText(
          text: "Definições & preferencias",
          style: TextStyleEnum.h3_bold,
        ),
        const AppGlobalVericalSpacing(),
        ProfileSectionCard(
          leading: SvgPicture.asset(
            securiteIconSvg,
            colorFilter: const ColorFilter.mode(
              primary900,
              BlendMode.srcIn,
            ),
          ),
          title: "Seguranca",
        ),
        ProfileSectionCard(
          leading: SvgPicture.asset(
            monIconSvg,
            colorFilter: const ColorFilter.mode(
              primary900,
              BlendMode.srcIn,
            ),
          ),
          title: "Modo Dark",
        ),
      ],
    );
  }

  _buidLogoutButton() {
    return ListTile(
      title: AppGlobalText(
        text: "Sair",
        style: TextStyleEnum.h3_bold,
        color: Colors.red.shade700,
        // color: primary400,
      ),
      leading: SvgPicture.asset(
        logoutIconSvg,
        width: 24.px,
        height: 24.px,
        colorFilter: ColorFilter.mode(
          Colors.red.shade700,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  _buildAppbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: Get.find<Navigation>().navigateToBack,
          child: SvgPicture.asset(
            arrowBackSvg2,
            width: 24.px,
            height: 24.px,
            colorFilter: const ColorFilter.mode(
              primary950,
              BlendMode.srcIn,
            ),
          ),
        ),
        AppGlobalText(
          text: "Meu Perfil",
          style: TextStyleEnum.h3_bold,
        ),
        Container()
      ],
    );
  }
}
