import 'package:flutter/material.dart';

class AppGlobalLoading extends StatelessWidget {
  const AppGlobalLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
