import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_back_button.dart';
import 'package:tchilla/view/widgets/app_global_network_image.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/viewmodel/event/choose_payment_method_viewmodel.dart';

class ReceiptMethodPage extends GetView<ChoosePaymentMethodViewmodel> {
  const ReceiptMethodPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppGlobalBackButton(),
      ),
      body: AppLayoutpage(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                child: AppGlobalNetworkImage(
                  height: 100.px,
                  width: 100.px,
                  image: AppAssetsImages.trnasfericon,
                ),
              ),
              AppGlobalVericalSpacing(
                value: 2.h,
              ),
              AppGlobalText(
                text: controller.localizations.payment_receipt_description,
                style: TextStyleEnum.p_normal,
                color: gray600,
                maxLines: 10,
              ),
              AppGlobalVericalSpacing(
                value: 2.h,
              ),

              Obx(() {
                final selectedFile = controller.selectedPdfFile.value;
                return Column(
                  children: [
                    AppGlobalVericalSpacing(value: 2.h),
                    Container(
                      width: 100.w,
                      height: 70.px,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: gray200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: selectedFile != null
                          ? Row(
                              children: [
                                Row(
                                  children: [
                                    AppGlobalNetworkImage(
                                      height: 50.px,
                                      width: 50.px,
                                      image: AppAssetsImages.pdfSvg,
                                    ),
                                    AppGlobalText(
                                      text: selectedFile.path.split("/").last,
                                      style: TextStyleEnum.p_normal,
                                      overflow: TextOverflow.ellipsis,
                                      color: gray600,
                                      maxLines: 1,
                                      width: 65.w,
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: controller.clearReceiptFile,
                                  child: const Icon(
                                    Icons.delete_outline_outlined,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            )
                          : GestureDetector(
                              onTap: controller.setReceiptevice,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AppGlobalText(
                                    text: "Carregar Comprovativo",
                                    style: TextStyleEnum.h3_medium,
                                    color: gray600,
                                  ),
                                  const AppGlobalHorizontalSpacing(),
                                  const Icon(
                                    Icons.file_upload_outlined,
                                    color: gray600,
                                  )
                                ],
                              ),
                            ),
                    ),
                    AppGlobalVericalSpacing(value: 2.h),
                  ],
                );
              }),
              AppGlobalVericalSpacing(value: 2.h),
              AppGlobalTextButton(
                onPressed: controller.submitReceiptevice,
                textButton: controller.localizations.send,
                minWidth: 100.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}
