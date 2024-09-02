import 'package:checkout_payment_ui/core/widgets/custom_button.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/payment_details_view.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/widgets/order_info_item.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/widgets/payment_methods_bottom_sheet.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/widgets/total_price_section.dart';
import 'package:flutter/material.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/images/basket_image.png')),
          const SizedBox(height: 20),
          const OrderInfoItem(title: 'Order Subtotal', value: r'$42.97'),
          const SizedBox(height: 10),
          const OrderInfoItem(title: 'Discount', value: r'$0'),
          const SizedBox(height: 10),
          const OrderInfoItem(title: 'Shipping', value: r'$8'),
          const Divider(
            height: 25,
            thickness: 2,
          ),
          const TotalPriceSection(title: 'Total', value: r'$50.97'),
          const SizedBox(height: 20),
          CustomButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const PaymentMethodsBottomSheet();
                    });
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const PaymentDetailsView()));
              },
              text: 'Complete Payment'),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
