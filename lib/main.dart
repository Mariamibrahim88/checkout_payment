import 'package:checkout_payment_ui/core/utils/api_keys.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/my_cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publicKey;
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}

//to save card info
//1. create payment intent(currency, amount,customer id)
//create Emphemeralkey(stripeVersion, customer id)
//2.initiate payment intent(merchantDisplayName,initClientSecret,emphemeralKeySecret)

//3.present payment sheet
//
