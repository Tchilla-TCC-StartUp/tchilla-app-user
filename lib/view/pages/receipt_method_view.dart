import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_network_image.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/viewmodel/event/choose_payment_method_viewmodel.dart';

class ReceiptMethodView extends StatefulWidget {
  final ChoosePaymentMethodViewmodel choosePaymentMethodViewmodel;
  const ReceiptMethodView(
      {super.key, required this.choosePaymentMethodViewmodel});

  @override
  State<ReceiptMethodView> createState() => _ReceiptMethodViewState();
}

class _ReceiptMethodViewState extends State<ReceiptMethodView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            text: widget.choosePaymentMethodViewmodel.localizations
                .payment_receipt_description,
            style: TextStyleEnum.p_normal,
            color: gray600,
            maxLines: 10,
          ),
          AppGlobalVericalSpacing(
            value: 2.h,
          ),
          Container(
            width: 100.w,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: gray300,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    AppGlobalText(
                      text: "AO",
                      style: TextStyleEnum.h3_bold,
                    ),
                    AppGlobalText(
                      text: widget.choosePaymentMethodViewmodel.iban,
                      style: TextStyleEnum.h3_medium,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: widget.choosePaymentMethodViewmodel.copyIban,
                  child: Icon(
                    Icons.copy_outlined,
                    size: 20,
                  ),
                )
              ],
            ),
          ),
          Obx(() {
            final selectedFile =
                widget.choosePaymentMethodViewmodel.selectedPdfFile.value;
            return Column(
              children: [
                AppGlobalVericalSpacing(value: 2.h),
                Container(
                  width: 100.w,
                  height: 70.px,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
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
                              child: Icon(
                                Icons.delete_outline_outlined,
                                size: 20,
                                color: Colors.red,
                              ),
                              onTap: widget.choosePaymentMethodViewmodel
                                  .clearReceiptFile,
                            )
                          ],
                        )
                      : GestureDetector(
                          onTap: widget
                              .choosePaymentMethodViewmodel.setReceiptevice,
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
            onPressed: widget
                .choosePaymentMethodViewmodel.navigator.navigateToSucessPage,
            textButton: widget.choosePaymentMethodViewmodel.localizations.send,
            minWidth: 100.w,
          )
        ],
      ),
    );
  }
}
