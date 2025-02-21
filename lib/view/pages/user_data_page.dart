import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_input.dart';
import 'package:tchilla/view/widgets/app_global_network_image.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tchilla/viewmodel/user_data_viewmodel.dart';

class UserDataPage extends StatefulWidget {
  final String id;
  const UserDataPage({super.key, required this.id});

  @override
  State<UserDataPage> createState() => _UserDataPageState();
}

class _UserDataPageState extends State<UserDataPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final viewmodel = Get.find<UserDataViewModel>();

  @override
  void initState() {
    super.initState();
    nameController.text = "Celson Paixão";
    emailController.text = "celson2020paixao@gmail.com";
    passwordController.text = "1234567890";
  }

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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 200.px,
              height: 200.px,
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: AppGlobalNetworkImage(
                image: AppAssetsImages.defaultUserImage,
              ),
            ),
            AppGlobalVericalSpacing(value: 18.px),
            _buildUserDataCard(
              controller: nameController,
              helpText: AppLocalizations.of(context)!.name,
              isEditable: viewmodel.isNameEditable,
              onToggleEditable: viewmodel.toggleNameEditable,
            ),
            AppGlobalVericalSpacing(value: 18.px),
            _buildUserDataCard(
              controller: emailController,
              helpText: AppLocalizations.of(context)!.email_address,
              isEditable: viewmodel.isEmailEditable,
              onToggleEditable: viewmodel.toggleEmailEditable,
            ),
            AppGlobalVericalSpacing(value: 18.px),
            _buildUserDataCard(
              controller: passwordController,
              helpText: AppLocalizations.of(context)!.password,
              isEditable: viewmodel.isPasswordEditable,
              onToggleEditable: viewmodel.togglePasswordEditable,
              isPassword: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserDataCard({
    required TextEditingController controller,
    required String helpText,
    required RxBool isEditable,
    required VoidCallback onToggleEditable,
    bool? isPassword,
  }) {
    return Obx(
      () => AppGlobalInput(
        helpText: helpText,
        controller: controller,
        obscureText: isPassword ?? false,
        readOnly: !isEditable.value,
        suffix: GestureDetector(
          onTap: onToggleEditable,
          child: Icon(
            isEditable.value ? Icons.check : Icons.edit_note_rounded,
            color: isEditable.value ? Colors.greenAccent.shade700 : primary800,
          ),
        ),
      ),
    );
  }

  Widget _buildAppbar() {
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
