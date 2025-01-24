import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AngolaPrice extends StatelessWidget {
  final double price;
  final TextStyle? style;

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
    return Text(
      _formatPrice(price),
      style: style ??
          TextStyle(
            color: Colors.amber.shade700,
            fontSize: 13.5,
            fontWeight: FontWeight.w700,
          ),
    );
  }
}
