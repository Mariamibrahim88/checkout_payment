import 'package:checkout_payment_ui/core/widgets/custom_app_bar.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/widgets/thank_u_view_body.dart';
import 'package:flutter/material.dart';

class ThankUView extends StatelessWidget {
  const ThankUView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Transform.translate(
          offset: const Offset(0, -16), child: const ThankUViewBody()),
    );
  }
}
