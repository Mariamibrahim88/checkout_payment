import 'package:checkout_payment_ui/core/widgets/custom_button.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/thank_u_view.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/widgets/custom_credit_card.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/widgets/payment_method_list.dart';
import 'package:flutter/material.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: PaymentMethodsListView(),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            autovalidateMode: autovalidateMode,
            formKey: formKey,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 12.0, left: 16.0, right: 16.0),
              child: CustomButton(
                text: 'Pay',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ThankUView();
                    }));
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
