class PaymentIntentInputModel {
  final String amount;
  final String currency;

  PaymentIntentInputModel({required this.amount, required this.currency});

// to transform data into map
// this is used instead of send body in post request
  toJson() {
    return {
      'amount': amount,
      'currency': currency,
    };
  }
}
