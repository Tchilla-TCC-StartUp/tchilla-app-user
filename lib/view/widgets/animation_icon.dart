import 'package:flutter/material.dart';
import 'package:tchilla/resources/app_enums.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';

class AnimationIcon extends StatefulWidget {
  final AnimationIconType type;

  const AnimationIcon({super.key, required this.type});

  @override
  State<AnimationIcon> createState() => _AnimationIconState();
}

class _AnimationIconState extends State<AnimationIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _leftSize;
  late Animation<double> _rightSize;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _leftSize = Tween<double>(begin: 20.0, end: 30.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _rightSize = Tween<double>(begin: 30.0, end: 20.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color get iconColor {
    switch (widget.type) {
      case AnimationIconType.success:
        return Colors.greenAccent.shade400;
      case AnimationIconType.error:
        return Colors.redAccent.shade400;
    }
  }

  IconData get iconData {
    switch (widget.type) {
      case AnimationIconType.success:
        return Icons.check_circle_outline_rounded;
      case AnimationIconType.error:
        return Icons.error_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData, size: _leftSize.value, color: iconColor),
              const AppGlobalHorizontalSpacing(),
              Icon(iconData, size: 60.0, color: iconColor),
              const AppGlobalHorizontalSpacing(),
              Icon(iconData, size: _rightSize.value, color: iconColor),
            ],
          );
        },
      ),
    );
  }
}
