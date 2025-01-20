import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tchilla/view/widgets/app_global_back_button.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/headerpage.dart';

class ForengePasswordConfitmationPinPage extends StatefulWidget {
  const ForengePasswordConfitmationPinPage({super.key});

  @override
  State<ForengePasswordConfitmationPinPage> createState() =>
      _ForengePasswordConfitmationPinPageState();
}

class _ForengePasswordConfitmationPinPageState
    extends State<ForengePasswordConfitmationPinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppGlobalBackButton(),
      ),
      body: const AppLayoutpage(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headerpage(
            title: "Pin de confirmação",
            description: "Enviamos um pin ao seu email para a\nconfirmação",
          ),
        ],
      )),
    );
  }
}
