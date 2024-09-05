import 'package:checkout_payment_ui/core/utils/show_snack_bar.dart';
import 'package:checkout_payment_ui/core/widgets/custom_button.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/thank_u_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ThankUView()));
        }
        if (state is PaymentFailure) {
          showSnackBar(context, state.errMessage, Colors.red);
        }
      },
      builder: (context, state) {
        return CustomButton(
            isLoading: state is PaymentLoading ? true : false,
            onPressed: () {
              PaymentIntentInputModel paymentInternInputModel =
                  PaymentIntentInputModel(amount: '100', currency: 'USD');

              BlocProvider.of<PaymentCubit>(context).makePayment(
                  paymentInternInputModel: paymentInternInputModel);
            },
            text: 'Continue');
      },
    );
  }
}
