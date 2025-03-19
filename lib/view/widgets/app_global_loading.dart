import 'package:flutter/material.dart';

class AppGlobalLoading extends StatelessWidget {
  final double strokeWidth;
  final Color? color;
  final Color? backgroundColor;
  final double? size;

  const AppGlobalLoading({
    super.key,
    this.strokeWidth = 4.0,
    this.color,
    this.backgroundColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    Widget loader = CircularProgressIndicator(
      strokeWidth: strokeWidth,
      valueColor: AlwaysStoppedAnimation<Color>(
        color ?? Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: backgroundColor,
    );

    // Se `size` foi passado, aplica SizedBox ao loader
    if (size != null) {
      loader = SizedBox(
        height: size,
        width: size,
        child: loader,
      );
    }

    return Center(child: loader);
  }
}
