import 'package:checkout_payment_ui/features/checkout/presentation/views/widgets/payment_method_item.dart';
import 'package:flutter/material.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethods = const [
    'assets/images/SVGRepo_iconCarrier.png',
    'assets/images/paypall.png',
    'assets/images/payapp.png',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 67,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethods.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                selectedIndex = index;
                setState(() {});
              },
              child: PaymentMethodItem(
                isActive: selectedIndex == index,
                image: paymentMethods[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
