import 'package:flutter/material.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem(
      {super.key, required this.isActive, required this.image});
  final bool isActive;
  final String image;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),

      width: 103,
      height: 67,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: isActive ? const Color(0xFF34A853) : Colors.grey,
                width: 1.5),
            borderRadius: BorderRadius.circular(15)),
        shadows: [
          BoxShadow(
              color: isActive ? const Color(0xFF34A853) : Colors.white,
              offset: const Offset(0, 0),
              blurRadius: 4,
              spreadRadius: 0),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset(image),
      ),
      //),
    );
  }
}
