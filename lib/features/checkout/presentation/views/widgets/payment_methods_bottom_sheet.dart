import 'package:checkout_payment_ui/features/checkout/presentation/views/widgets/custom_button_bloc_consumer.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/widgets/payment_method_list.dart';
import 'package:flutter/material.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  bool isPaypal = false;

  updatePaymentMethod({required int index}) {
    if (index == 0) {
      isPaypal = false;
    } else {
      isPaypal = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16,
          ),
          PaymentMethodsListView(

              // updatePaymentMethod: updatePaymentMethod,
              ),
          SizedBox(
            height: 32,
          ),
          CustomButtonBlocConsumer(),

          // CustomButtonBlocConsumer(
          //   isPaypal: isPaypal,
          // ),
        ],
      ),
    );
  }
}
