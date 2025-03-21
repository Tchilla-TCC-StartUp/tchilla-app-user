import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/angola_price.dart';
import 'package:tchilla/view/widgets/app_global_network_image.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';


class ProposedCard extends StatelessWidget {
  final String? id;
  final String? image;
  final String? name;
  final String? location;
  final int? suportpersonNumer;
  final String? fortypeEvent;
  final double? price;
  final void Function() onClick;
  final List<String>? services;
  const ProposedCard({
    super.key,
    this.id,
    this.image,
    this.name,
    this.location,
    this.suportpersonNumer,
    this.fortypeEvent,
    this.price,
    this.services,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Row(
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
      ),
    );
  }

  _buildBodyInfo() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppGlobalText(
            text: name ?? "Salão de Festa Mela",
            style: TextStyleEnum.h3_bold,
          ),
          AppGlobalVericalSpacing(
            value: 2.px,
          ),
          AppGlobalText(
            text: fortypeEvent ?? "Casemento",
            style: TextStyleEnum.p_medium,
            color: primary800,
          ),
          AppGlobalVericalSpacing(
            value: 2.px,
          ),
          SingleChildScrollView(
            child: Row(
              children: services
                      ?.map((e) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Container(
                              height: 25.px,
                              decoration: BoxDecoration(
                                color: primary100,
                                borderRadius: BorderRadius.circular(8.px),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    e,
                                    style: TextStyle(fontSize: 11.px),
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .toList() ??
                  [],
            ),
          ),
          AppGlobalVericalSpacing(
            value: 2.px,
          ),
          _buildBottomInfo()
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
                "${suportpersonNumer ?? 150} Pessoas",
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
                price: price ?? 150000,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.px),
      child: AppGlobalNetworkImage(
        image: AppAssetsImages.defaultProposedImage,
        width: 35.w,
        height: 12.h,
      ),
    );
  }
}
