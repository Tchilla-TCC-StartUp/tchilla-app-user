import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/view/widgets/app_global_input.dart';
import 'package:tchilla/view/widgets/app_global_network_image.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class McxMethodView extends StatefulWidget {
  const McxMethodView({super.key});

  @override
  State<McxMethodView> createState() => _McxMethodViewState();
}

class _McxMethodViewState extends State<McxMethodView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppLayoutpage(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              elevation: 8,
              clipBehavior: Clip.hardEdge,
              child: ClipRRect(
                child: AppGlobalNetworkImage(
                  width: 100.px,
                  height: 100.px,
                  image: AppAssetsImages.mcxNetworkImage,
                ),
              ),
            ),
            AppGlobalVericalSpacing(value: 1.h,),
            AppGlobalInput( hintText: AppLocalizations.of(context)!.telephone_number,)
          ],
        ),
      ),
    );
  }
}
