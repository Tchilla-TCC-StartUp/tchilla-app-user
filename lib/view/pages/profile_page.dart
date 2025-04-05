import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/view/widgets/app_global_network_image.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_user_avatar_name.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/profile_section_card.dart';
import 'package:tchilla/viewmodel/profile_viewmodel.dart';

class ProfilePage extends StatefulWidget {
  final String userNamer;

  const ProfilePage({
    super.key,
    required this.userNamer,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final viewmodel = Get.find<ProfileViewmodel>();
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
          body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileSectionCard(
              onTap: viewmodel.goToUserDataPage,
              title: widget.userNamer,
              leading: ClipOval(
                child: AppGlobalUserAvatarName(name: widget.userNamer),
              ),
            ),
            ProfileSectionCard(
              onTap: viewmodel.goToSchedulesPage,
              leading: SvgPicture.asset(
                AppAssetsImages.listIconSvg,
                colorFilter: const ColorFilter.mode(
                  primary900,
                  BlendMode.srcIn,
                ),
              ),
              title: viewmodel.localizations.my_schedules,
            ),
            ProfileSectionCard(
              onTap: viewmodel.goToNotificatiosPage,
              leading: SvgPicture.asset(
                AppAssetsImages.notificationIconSvg,
                colorFilter: const ColorFilter.mode(
                  primary900,
                  BlendMode.srcIn,
                ),
              ),
              title: viewmodel.localizations.notifications,
            ),
            // const Divider(color: primary200),
            // _builPreferences(),
            const Divider(
              color: primary200,
            ),
            _buildSuporte(),
            _buidLogoutButton()
          ],
        ),
      )),
    );
  }

  _buildSuporte() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppGlobalText(
          text: viewmodel.localizations.support,
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
          title: viewmodel.localizations.help_center,
        ),
        ProfileSectionCard(
          leading: SvgPicture.asset(
            AppAssetsImages.questionIconSvg,
            colorFilter: const ColorFilter.mode(
              primary900,
              BlendMode.srcIn,
            ),
          ),
          title: viewmodel.localizations.faqs,
        ),
      ],
    );
  }

  _builPreferences() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppGlobalText(
          text: viewmodel.localizations.settings_preferences,
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
          title: viewmodel.localizations.security,
        ),
        ProfileSectionCard(
          leading: SvgPicture.asset(
            AppAssetsImages.moonIconSvg,
            colorFilter: const ColorFilter.mode(
              primary900,
              BlendMode.srcIn,
            ),
          ),
          title: viewmodel.localizations.dark_mode,
        ),
      ],
    );
  }

  _buidLogoutButton() {
    return ListTile(
      title: AppGlobalText(
        text: viewmodel.localizations.logout,
        style: TextStyleEnum.h3_bold,
        color: Colors.red.shade700,
        // color: primary400,
      ),
      onTap: viewmodel.logout,
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
          text: viewmodel.localizations.my_profile,
          style: TextStyleEnum.h3_bold,
        ),
        Container()
      ],
    );
  }
}
