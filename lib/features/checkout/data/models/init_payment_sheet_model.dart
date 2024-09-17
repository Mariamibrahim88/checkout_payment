class InitPaymentSheetModel {
  final String clientSecret;
  final String ephemeralKeySecret;
  final String customerId;

  InitPaymentSheetModel(
      {required this.clientSecret,
      required this.ephemeralKeySecret,
      required this.customerId}); //if user is logged in and not guest
}
//'cus_QnhK9gq8tWwflr'
