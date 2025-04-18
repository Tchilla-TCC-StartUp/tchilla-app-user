import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_size.dart';

class AppLayoutpage extends StatelessWidget {
  final Widget body;
  final bool isRefresh;
  final Future<void> Function()? onRefresh;

  const AppLayoutpage({
    super.key,
    required this.body,
    this.isRefresh = false,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final child = GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: getAdaptativeWidth(7.w, 5.w, 3.w),
        ),
        child: body,
      ),
    );

    // Se `isRefresh` for true, envolve com RefreshIndicator
    return isRefresh && onRefresh != null
        ? RefreshIndicator(
            onRefresh: onRefresh!,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: child,
              ),
            ),
          )
        : child;
  }
}
