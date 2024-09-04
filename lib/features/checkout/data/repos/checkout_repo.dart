import 'package:checkout_payment_ui/core/utils/errors/failures.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';

abstract class ChechoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentInternInputModel});
}
