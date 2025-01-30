import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class AngolaPrice extends StatelessWidget {
  final double price;
  final TextStyleEnum? style;

  const AngolaPrice({
    super.key,
    required this.price,
    this.style,
  });

  String _formatPrice(double value) {
    final formatter = NumberFormat.currency(
      locale: 'pt_AO',
      decimalDigits: 2,
      symbol: '',
    );
    return "${formatter.format(value)} kz";
  }

  @override
  Widget build(BuildContext context) {
    return AppGlobalText(
      text: _formatPrice(price),
      style: style ?? TextStyleEnum.p_bold,
      color: primary800,
    );
  }
}
