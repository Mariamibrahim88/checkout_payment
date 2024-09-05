import 'package:checkout_payment_ui/core/utils/api_keys.dart';
import 'package:checkout_payment_ui/core/utils/api_service.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/payment_intern_model/payment_intern_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StribeService {
  final ApiService apiService = ApiService();

  // paymentIntentObject create payment intent (amount, currency)

  Future<PaymentInternModel> createpaymentIntern(
      PaymentIntentInputModel paymentInternInputModel) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      body: paymentInternInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.secretKey,
    );

    var paymentIntentModel = PaymentInternModel.fromJson(response.data);

    return paymentIntentModel;
  }

  // initPaymentSheet (paymentIntentClientSecret)

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentIntentClientSecret,
      // name the owner of the card

      merchantDisplayName: 'Mariam',
    ));
  }

  //presentPaymentSheet()

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  // do payment with three steps that we created before

  Future makePayment(
      {required PaymentIntentInputModel paymentInternInputModel}) async {
    var paymentIntentModel = await createpaymentIntern(paymentInternInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();
  }
}
