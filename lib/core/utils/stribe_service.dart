import 'package:checkout_payment_ui/core/utils/api_keys.dart';
import 'package:checkout_payment_ui/core/utils/api_service.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/epheremal_key_model/ephemeral_key/ephemeral_key.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/init_payment_sheet_model.dart';
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

  Future initPaymentSheet(
      {required InitPaymentSheetModel initPaymentSheetModel}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: initPaymentSheetModel.clientSecret,
      customerEphemeralKeySecret: initPaymentSheetModel.ephemeralKeySecret,
      customerId: initPaymentSheetModel.customerId,
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
    var ephemeralKey = await createEphemeralKey(
        customerId: paymentInternInputModel.customerId);

    var initPaymentSheetModel = InitPaymentSheetModel(
        clientSecret: paymentIntentModel.clientSecret!,
        ephemeralKeySecret: ephemeralKey.secret!,
        customerId: paymentInternInputModel.customerId);
    await initPaymentSheet(initPaymentSheetModel: initPaymentSheetModel);
    await displayPaymentSheet();
  }

  Future<EphemeralKey> createEphemeralKey({required String customerId}) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      body: {
        'customer': customerId,
      },
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.secretKey,
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKey}',
        'Stripe-Version': '2024-06-20',
      },
    );

    var ephemeralKeyResult = EphemeralKey.fromJson(response.data);

    return ephemeralKeyResult;
  }
}
