import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/model/proposed_model.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/resources/app_enums.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/angola_price.dart';
import 'package:tchilla/view/widgets/app_global_network_image.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class ProductCard extends StatelessWidget {
  final ProposedModel? proposed;
  const ProductCard({super.key, this.proposed});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _buildImage(),
        ),
        AppGlobalHorizontalSpacing(
          value: 2.w,
        ),
        Expanded(
          flex: 3,
          child: _buildBodyInfo(),
        )
      ],
    );
  }

  _buildBodyInfo() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppGlobalText(
            text: proposed?.name ?? "Salão de Festa Mela",
            style: TextStyleEnum.h3_bold,
          ),
          AppGlobalVericalSpacing(
            value: 2.px,
          ),
          Row(
            mainAxisAlignment: proposed?.status != null
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.start,
            children: [
              AppGlobalText(
                text: proposed?.typeEvent ?? "Casemento",
                style: TextStyleEnum.p_medium,
                color: primary800,
              ),
              if (proposed?.status != null)
                _buildState(status: proposed!.status!)
            ],
          ),
          AppGlobalVericalSpacing(
            value: 2.px,
          ),
          _buildBottomInfo(),
        ],
      );

  _buildBottomInfo() {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppAssetsImages.personsIconSvg,
                colorFilter: const ColorFilter.mode(
                  primary900,
                  BlendMode.srcIn,
                ),
                width: 20.px,
                height: 25.px,
              ),
              AppGlobalHorizontalSpacing(
                value: 3.px,
              ),
              Text(
                "${proposed?.suportpersonNumer ?? 150} Pessoas",
                style: TextStyle(
                  color: primaryBorder,
                  fontSize: 12.px,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: [
              AngolaPrice(
                price: proposed?.price ?? 150000,
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildState({required ProposedStatus status}) {
    switch (status) {
      case ProposedStatus.cancelad:
        return Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.3),
            borderRadius: BorderRadius.circular(6),
          ),
          child: AppGlobalText(
            text: "Cancelado",
            style: TextStyleEnum.button_text,
            color: Colors.red.shade900,
          ),
        );
      case ProposedStatus.sucess:
        return Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.3),
            borderRadius: BorderRadius.circular(6),
          ),
          child: AppGlobalText(
            text: "Realizado",
            style: TextStyleEnum.button_text,
            color: Colors.green.shade900,
          ),
        );
      case ProposedStatus.pending:
        return Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.3),
            borderRadius: BorderRadius.circular(6),
          ),
          child: AppGlobalText(
            text: "Pendente",
            style: TextStyleEnum.button_text,
            color: Colors.amber.shade900,
          ),
        );
    }
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.px),
      child: Stack(
        children: [
          AppGlobalNetworkImage(
            image: AppAssetsImages.defaultProposedImage,
            width: 35.w,
            height: 12.h,
          ),
        ],
      ),
    );
  }
}
