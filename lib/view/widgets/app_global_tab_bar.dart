import 'package:flutter/material.dart';

class AppGlobalTabBar extends StatelessWidget {
  final TabController tabController;
  final ValueChanged<int>? onTap;
  final List<String> tabs;
  final Color? unselectedLabelColor;
  final Color? labelColor;
  final Color? indicatorColor;
  final bool isScrollable;
  final TabAlignment tabAlignment;

  const AppGlobalTabBar({
    Key? key,
    required this.tabController,
    required this.tabs,
    this.onTap,
    this.unselectedLabelColor,
    this.labelColor,
    this.indicatorColor,
    this.isScrollable = true,
    this.tabAlignment = TabAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      onTap: onTap,
      isScrollable: isScrollable,
      unselectedLabelColor: unselectedLabelColor,
      labelColor: labelColor,
      indicatorColor: indicatorColor,
      tabAlignment: tabAlignment,
      tabs: tabs.map((title) => Tab(text: title)).toList(),
    );
  }
}
