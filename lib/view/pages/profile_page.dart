import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/util/events/navigation.dart';
import 'package:tchilla/view/widgets/app_global_network_image.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: primary50,
          systemNavigationBarColor: primary50,
        ),
        leadingWidth: 0,
        leading: const SizedBox.shrink(),
        centerTitle: true,
        title: _buildAppbar(),
      ),
      body: AppLayoutpage(
          body: Column(
        children: [
          ProfileSectionCard(
            leading: ClipOval(
              child: AppGlobalNetworkImage(
                image: AppAssetsImages.defaultUserImage,
                width: 40.px,
                height: 40.px,
              ),
            ),
            title: "Celson Paixão",
          ),
          ProfileSectionCard(
            leading: SvgPicture.asset(
              AppAssetsImages.listIconSvg,
              colorFilter: const ColorFilter.mode(
                primary900,
                BlendMode.srcIn,
              ),
            ),
            title: "Meus Agendamentos",
          ),
          ProfileSectionCard(
            leading: SvgPicture.asset(
              AppAssetsImages.notificationIconSvg,
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
            AppAssetsImages.notepadIconSvg,
            colorFilter: const ColorFilter.mode(
              primary900,
              BlendMode.srcIn,
            ),
          ),
          title: "Centro de apoio",
        ),
        ProfileSectionCard(
          leading: SvgPicture.asset(
            AppAssetsImages.questionIconSvg,
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
            AppAssetsImages.securityIconSvg,
            colorFilter: const ColorFilter.mode(
              primary900,
              BlendMode.srcIn,
            ),
          ),
          title: "Seguranca",
        ),
        ProfileSectionCard(
          leading: SvgPicture.asset(
            AppAssetsImages.moonIconSvg,
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
        AppAssetsImages.logoutIconSvg,
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
            AppAssetsImages.arrowBackSvg2,
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
