import 'package:checkout_payment_ui/core/utils/errors/failures.dart';
import 'package:checkout_payment_ui/core/utils/stribe_service.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment_ui/features/checkout/data/repos/checkout_repo.dart';
import 'package:dartz/dartz.dart';

class CheckoutRepoImpl implements ChechoutRepo {
  final StribeService stribeservice = StribeService();

  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentInternInputModel}) async {
    try {
      await stribeservice.makePayment(
          paymentInternInputModel: paymentInternInputModel);

      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
