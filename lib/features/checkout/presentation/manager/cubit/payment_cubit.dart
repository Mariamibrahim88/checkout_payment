import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment_ui/features/checkout/data/repos/checkout_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.chechoutRepo) : super(PaymentInitial());

  final ChechoutRepo chechoutRepo;

  Future makePayment(
      {required PaymentIntentInputModel paymentInternInputModel}) async {
    emit(PaymentLoading());
    final result = await chechoutRepo.makePayment(
        paymentInternInputModel: paymentInternInputModel);

    result.fold(
      (failure) => emit(PaymentFailure(errMessage: failure.toString())),
      (success) => emit(PaymentSuccess()),
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
