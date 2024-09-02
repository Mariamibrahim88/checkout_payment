import 'package:checkout_payment_ui/features/checkout/presentation/views/widgets/custom_check_icon.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/widgets/custom_dashed_line.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/widgets/thank_u_card.dart';
import 'package:flutter/material.dart';

class ThankUViewBody extends StatelessWidget {
  const ThankUViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(clipBehavior: Clip.none, children: [
        const ThankUCard(),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height * .2 + 20,
          left: 20 + 8,
          right: 20 + 8,
          child: const CustomDashedLine(),
        ),
        Positioned(
            left: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              // radius: 50,
              //child: Icon(Icons.check, color: Colors.green, size: 50),
            )),
        Positioned(
            right: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            )),
        const Positioned(
          top: -50,
          left: 0,
          right: 0,
          child: CustomCheckIcon(),
        ),
      ]),
    );
  }
}
