import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/pages/error_try_again.dart';
import 'package:tchilla/view/widgets/app_global_input.dart';
import 'package:tchilla/view/widgets/app_global_loading.dart';
import 'package:tchilla/view/widgets/app_global_phone_number_input.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_global_user_avatar_name.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/viewmodel/event/user_data_viewmodel.dart';

class UserDataPage extends GetView<UserDataViewModel> {
  const UserDataPage({super.key});

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
            return controller.localLoading.value
                ? const Center(child: AppGlobalLoading())
                : controller.isError.value
                    ? ErrorTryAgain(message: controller.errorMessage.value)
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppGlobalUserAvatarName(
                              name: controller.name.value ?? "",
                              size: 150.px,
                            ),
                            AppGlobalVericalSpacing(value: 18.px),

                            // Name
                            AppGlobalInput(
                              helpText: controller.localizations.name,
                              initialValue: controller.name.value ?? '',
                              onChanged: controller.setName,
                            ),
                            AppGlobalVericalSpacing(value: 18.px),

                            // Email
                            AppGlobalInput(
                              helpText: controller.localizations.email_address,
                              initialValue: controller.email.value ?? '',
                              onChanged: controller.setEmail,
                            ),
                            AppGlobalVericalSpacing(value: 18.px),

                            // Phone
                            AppGlobalPhoneNumberInput(
                              label: controller.localizations.telephone_number,
                              initialValue: controller.telefone.value ?? '',
                              initialCountryCode: '+244',
                              onCountryCodeChanged: (code) {
                                controller.countryCode.value = code;
                                print(code);
                              },
                              onChanged: controller.setPhoneNumer,
                            ),
                            AppGlobalVericalSpacing(value: 18.px),

                            // Password
                            AppGlobalInput(
                              readOnly: true,
                              suffix: GestureDetector(
                                onTap: controller.togglePasswordEditable,
                                child: Icon(
                                  Icons.edit_note_rounded,
                                  size: 16.px,
                                ),
                              ),
                              helpText: controller.localizations.password,
                              initialValue: controller.password.value ?? '',
                              obscureText: true,
                            ),
                            AppGlobalVericalSpacing(value: 28.px),
                            AppGlobalTextButton(
                              textButton: controller.localizations.save,
                              minWidth: 100.w,
                              isLoading: controller.isLoading.value,
                              onPressed: controller.updateUser,
                            )
                          ],
                        ),
                      );
          },
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
          text: controller.name.value ?? '',
          style: TextStyleEnum.h3_bold,
        ),
        Container()
      ],
    );
  }
}
