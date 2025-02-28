import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppGlobalShowAndHideAnimationController extends GetxController {
  final RxBool isVisible = true.obs;

  void updateVisibility(List<FocusNode> focusNodes) {
    // Se algum campo está focado, esconder; senão, mostrar
    isVisible.value = !focusNodes.any((node) => node.hasFocus);
  }
}

class AppGlobalShowAndHideAnimation extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final List<Widget> children;
  final Duration duration;
  final Curve curve;
  final AppGlobalShowAndHideAnimationController? controller;

  const AppGlobalShowAndHideAnimation({
    Key? key,
    required this.focusNodes,
    required this.children,
    this.duration = const Duration(milliseconds: 600),
    this.curve = Curves.easeInOut,
    this.controller,
  }) : super(key: key);

  @override
  _AppGlobalShowAndHideAnimationState createState() =>
      _AppGlobalShowAndHideAnimationState();
}

class _AppGlobalShowAndHideAnimationState
    extends State<AppGlobalShowAndHideAnimation> {
  late AppGlobalShowAndHideAnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        widget.controller ?? Get.put(AppGlobalShowAndHideAnimationController());

    for (var focusNode in widget.focusNodes) {
      focusNode.addListener(() {
        controller.updateVisibility(widget.focusNodes);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedOpacity(
        opacity: controller.isVisible.value ? 1.0 : 0.0,
        duration: widget.duration,
        curve: widget.curve,
        child: AnimatedScale(
          scale: controller.isVisible.value ? 1.0 : 0.0,
          duration: widget.duration,
          curve: widget.curve,
          child: AnimatedSize(
            duration: widget.duration,
            curve: widget.curve,
            clipBehavior: Clip.hardEdge,
            child: controller.isVisible.value
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: widget.children,
                  )
                : const SizedBox(), // Oculta completamente
          ),
        ),
      ),
    );
  }
}
