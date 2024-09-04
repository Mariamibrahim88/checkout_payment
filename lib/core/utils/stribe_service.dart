import 'package:checkout_payment_ui/core/utils/api_keys.dart';
import 'package:checkout_payment_ui/core/utils/api_service.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/payment_intern_model/payment_intern_model.dart';

class StribeService {
  final ApiService apiService = ApiService();
  Future<PaymentInternModel> createpaymentIntern(
      PaymentIntentInputModel paymentInternInputModel) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      body: paymentInternInputModel.toJson(),
      token: ApiKeys.secretKey,
    );

    var result = PaymentInternModel.fromJson(response.data);

    return result;
  }
}
