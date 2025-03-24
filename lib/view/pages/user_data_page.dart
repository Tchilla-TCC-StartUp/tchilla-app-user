import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/pages/error_try_again.dart';
import 'package:tchilla/view/widgets/app_global_input.dart';
import 'package:tchilla/view/widgets/app_global_network_image.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/viewmodel/user_data_viewmodel.dart';

class UserDataPage extends StatefulWidget {
  const UserDataPage({super.key});

  @override
  State<UserDataPage> createState() => _UserDataPageState();
}

class _UserDataPageState extends State<UserDataPage> {
  final viewmodel = Get.find<UserDataViewModel>();

  @override
  void initState() {
    super.initState();
    viewmodel.initEvets();
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
        body: Obx(
          () {
            return viewmodel.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : viewmodel.isError.value
                    ? ErrorTryAgain(message: viewmodel.errorMessage.value)
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 150.px,
                              height: 150.px,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.w)),
                              child: AppGlobalNetworkImage(
                                image: viewmodel
                                    .getImageUrl(viewmodel.image.value),
                              ),
                            ),
                            AppGlobalVericalSpacing(value: 18.px),
                            _buildUserDataCard(
                              initalValue: viewmodel.name.value ?? '',
                              helpText: viewmodel.localizations.name,
                              isEditable: viewmodel.isNameEditable,
                              onToggleEditable: viewmodel.toggleNameEditable,
                              onChanged: viewmodel.setName,
                            ),
                            AppGlobalVericalSpacing(value: 18.px),
                            _buildUserDataCard(
                              initalValue: viewmodel.email.value ?? '',
                              helpText: viewmodel.localizations.email_address,
                              isEditable: viewmodel.isEmailEditable,
                              onToggleEditable: viewmodel.toggleEmailEditable,
                              onChanged: viewmodel.setEmail,
                            ),
                            AppGlobalVericalSpacing(value: 18.px),
                            _buildUserDataCard(
                              initalValue: viewmodel.password.value ?? '',
                              helpText: viewmodel.localizations.password,
                              isEditable: viewmodel.isPasswordEditable,
                              onToggleEditable:
                                  viewmodel.togglePasswordEditable,
                              isPassword: true,
                            ),
                            AppGlobalVericalSpacing(value: 28.px),
                            AppGlobalTextButton(
                              textButton: viewmodel.localizations.save,
                              minWidth: 100.w,
                              onPressed: () {},
                            )
                          ],
                        ),
                      );
          },
        ),
      ),
    );
  }

  Widget _buildUserDataCard({
    required String initalValue,
    required String helpText,
    required RxBool isEditable,
    required VoidCallback onToggleEditable,
    void Function(String)? onChanged,
    bool? isPassword,
  }) {
    return AppGlobalInput(
      helpText: helpText,
      initialValue: initalValue,
      obscureText: isPassword ?? false,
      readOnly: !isEditable.value,
      onChanged: onChanged,
      suffix: GestureDetector(
        onTap: onToggleEditable,
        child: Icon(
          size: 16.px,
          isEditable.value ? Icons.check : Icons.edit_note_rounded,
          color: isEditable.value ? Colors.greenAccent.shade700 : primary800,
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
          text: viewmodel.name.value ?? '',
          style: TextStyleEnum.h3_bold,
        ),
        Container()
      ],
    );
  }
}
