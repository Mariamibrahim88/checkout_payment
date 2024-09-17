import 'dart:developer';

import 'package:checkout_payment_ui/core/utils/api_keys.dart';
import 'package:checkout_payment_ui/core/utils/show_snack_bar.dart';
import 'package:checkout_payment_ui/core/widgets/custom_button.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/amount_model/details.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/item_list_model/item.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/thank_u_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          showSnackBar(context, 'success', Colors.green);

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ThankUView()));
        }
        if (state is PaymentFailure) {
          Navigator.pop(context);
          showSnackBar(context, state.errMessage, Colors.red);
        }
      },
      builder: (context, state) {
        return CustomButton(
            isLoading: state is PaymentLoading ? true : false,
            onPressed: () {
              // PaymentIntentInputModel paymentInternInputModel =
              //     PaymentIntentInputModel(
              //         amount: '100',
              //         currency: 'USD',
              //         customerId: 'cus_QnhK9gq8tWwflr');

              // BlocProvider.of<PaymentCubit>(context).makePayment(
              //     paymentInternInputModel: paymentInternInputModel);
              var transactionData = getTransacrionData();
              executePaypalPayment(context, transactionData);
            },
            //child: const Text('Pay with paypal'),

            text: 'Continue');
      },
    );
  }

  void executePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transactionData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true, //test mode
        clientId: ApiKeys.clientId,
        secretKey: ApiKeys.paypalSecretKey,
        transactions: [
          {
            "amount": transactionData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amount, ItemListModel itemList}) getTransacrionData() {
    var amount = AmountModel(
        total: "100",
        currency: "USD",
        details: Details(subtotal: "100", shipping: "0", shippingDiscount: 0));

    List<OrderItemModel> orders = [
      OrderItemModel(name: "Apple", quantity: 10, price: "4", currency: "USD"),
      OrderItemModel(name: "Apple", quantity: 12, price: "5", currency: "USD"),
    ];
    var itemList = ItemListModel(
      items: orders,
    );

    return (amount: amount, itemList: itemList);
  }
}
