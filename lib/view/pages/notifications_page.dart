import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_back_button.dart';
import 'package:tchilla/view/widgets/app_global_loading.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/viewmodel/notification_viewmodel.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final viewmodel = Get.find<NotificationViewmodel>();

  @override
  void initState() {
    super.initState();

    viewmodel.getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppGlobalBackButton(),
        title: AppGlobalText(
          text: viewmodel.localizations.notifications,
          style: TextStyleEnum.h3_bold,
        ),
        centerTitle: true,
      ),
      body: AppLayoutpage(
        body: Obx(
          () {
            return viewmodel.isLoading.value
                ? const AppGlobalLoading()
                : Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: _builBody(),
                  );
          },
        ),
      ),
    );
  }

  _builBody() {
    return viewmodel.localnotification.isEmpty
        ? Center(
            child: AppGlobalText(text: '', style: TextStyleEnum.h3_bold),
          )
        : ListView.builder(
            itemCount: viewmodel.localnotification.length,
            itemBuilder: (
              context,
              index,
            ) {
              var item = viewmodel.localnotification[index];
              return _buildCardNotification(
                title: item.title ?? "",
                isRed: item.isRead ?? false,
                description: item.message ?? '',
              );
            },
          );
  }

  _buildCardNotification(
      {required String title,
      required String description,
      required bool isRed}) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Card(
          color: primary50,
          child: ListTile(
            trailing: SvgPicture.asset(
              AppAssetsImages.arrowRightSvg2,
            ),
            leading: Container(
              padding: EdgeInsets.all(10.px),
              decoration: BoxDecoration(
                color: primary900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                AppAssetsImages.notificationIconSvg,
              ),
            ),
            title: AppGlobalText(text: title, style: TextStyleEnum.p_bold),
            subtitle:
                AppGlobalText(text: description, style: TextStyleEnum.p_normal),
          ),
        ),
        if (isRed != true)
          Container(
            width: 15.px,
            height: 15.px,
            decoration: BoxDecoration(
              color: Colors.red.shade600,
              borderRadius: BorderRadius.circular(50.px),
            ),
          )
      ],
    );
  }
}
