import 'package:checkout_payment_ui/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.isLoading = false});

  final void Function() onPressed;
  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 73,
        decoration: BoxDecoration(
          color: const Color(0xFF34A853),
          borderRadius: BorderRadius.circular(15),
        ),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Center(
                child: Text(
                  text,
                  style: Styles.style22,
                ),
              ),
      ),
    );
  }
}
