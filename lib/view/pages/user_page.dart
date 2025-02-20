import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserDataPage extends StatefulWidget {
  final String id;
  const UserDataPage({super.key, required this.id});

  @override
  State<UserDataPage> createState() => _UserDataPageState();
}

class _UserDataPageState extends State<UserDataPage> {
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
      body: const AppLayoutpage(
          body: Column(
        children: [],
      )),
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
          text: "Celson Paixão",
          style: TextStyleEnum.h3_bold,
        ),
        Container()
      ],
    );
  }
}
