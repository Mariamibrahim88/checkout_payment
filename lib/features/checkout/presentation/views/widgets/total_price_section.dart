import 'package:checkout_payment_ui/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TotalPriceSection extends StatelessWidget {
  const TotalPriceSection(
      {super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Styles.style24),
        const Spacer(),
        Text(value, style: Styles.style24),
      ],
    );
  }
}
