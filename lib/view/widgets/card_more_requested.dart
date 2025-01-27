import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_constats.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/angola_price.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/shimmer_loading.dart';

class CardMoreRequested extends StatelessWidget {
  final String? id;
  final String? image;
  final String? name;
  final String? state;
  final String? location;
  final int? suportpersonNumer;
  final String? fortypeEvent;
  final double? price;
  final void Function() onClick;
  final List<String>? services;
  const CardMoreRequested({
    super.key,
    this.id,
    this.image,
    this.name,
    this.location,
    this.suportpersonNumer,
    this.fortypeEvent,
    this.price,
    required this.onClick,
    this.services,
    this.state,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 60.w,
        height: 30.h,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: primary50,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: _buildImage(),
            ),
            AppGlobalHorizontalSpacing(
              value: 2.px,
            ),
            Expanded(
              flex: 2,
              child: _buildBodyInfo(),
            )
          ],
        ),
      ),
    );
  }

  _buildBodyInfo() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppGlobalText(
                  text: name ?? "Salão de Festa Mela",
                  style: TextStyleEnum.h3_bold,
                ),
                AppGlobalText(
                  text: state ?? "Livre",
                  style: TextStyleEnum.h3_bold,
                  color: Colors.green,
                ),
              ],
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
              value: 3.px,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
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
              value: 3.px,
            ),
            _buildBottomInfo()
          ],
        ),
      );

  _buildBottomInfo() {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                personsIconoSvg,
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
    return CachedNetworkImage(
      width: 60.w,
      height: 15.h,
      imageUrl: defultProposedImage,
      placeholder: (context, url) => ShimmerLoading(
        width: 50.w,
        height: 12.h,
      ),
      errorWidget: (context, url, error) =>
          const Icon(Icons.error, color: Colors.red),
      fit: BoxFit.cover,
    );
  }
}
