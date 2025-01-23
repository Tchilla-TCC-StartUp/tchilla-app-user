import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';

class AppGlobalShowAndHideAnimationController extends GetxController {
  final RxBool isVisible = true.obs;

  void toggleVisibility(bool hasFocus) {
    isVisible.value = !hasFocus;
  }
}

class AppGlobalShowAndHideAnimation extends StatelessWidget {
  final List<FocusNode> focusNodes;
  final List<Widget> children;
  final Duration duration;
  final Curve curve;

  AppGlobalShowAndHideAnimation({
    Key? key,
    required this.focusNodes,
    required this.children,
    this.duration = const Duration(milliseconds: 600),
    this.curve = Curves.easeInOut,
  }) : super(key: key);

  final AppGlobalShowAndHideAnimationController controller =
      Get.put(AppGlobalShowAndHideAnimationController());

  @override
  Widget build(BuildContext context) {
  
    for (var focusNode in focusNodes) {
      focusNode.addListener(() {
        controller.toggleVisibility(focusNode.hasFocus);
      });
    }

    return Obx(
      () => AnimatedSize(
        duration: duration,
        curve: curve,
        clipBehavior: Clip.hardEdge,
        child: controller.isVisible.value
            ? AnimatedOpacity(
                opacity: controller.isVisible.value ? 1 : 0,
                duration: duration,
                curve: curve,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
              )
            : AppGlobalVericalSpacing(
                    value: 2.h,
                  ),
      ),
    );
  }
}
