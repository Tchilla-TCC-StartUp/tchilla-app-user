import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class AppGlobalShimmer extends StatefulWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const AppGlobalShimmer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  @override
  _AppGlobalShimmerState createState() => _AppGlobalShimmerState();
}

class _AppGlobalShimmerState extends State<AppGlobalShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _animation = Tween<double>(begin: -2, end: 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return ui.Gradient.linear(
              Offset(bounds.width * _animation.value, 0),
              Offset(bounds.width * (_animation.value + 1), 0),
              [
                Colors.grey[200]!,
                Colors.grey[100]!,
                Colors.grey[200]!,
              ],
              [0.2, 0.5, 0.8],
              TileMode.mirror,
            );
          },
          blendMode: BlendMode.srcIn,
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
