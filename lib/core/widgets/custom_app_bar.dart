import 'package:checkout_payment_ui/core/utils/styles.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar({final String? title}) {
  return AppBar(
    leading: const Center(
        child: Icon(Icons.arrow_back_rounded, color: Colors.black, size: 35)),
    //Center(child: SvgPicture.asset('assets/images/iPhone 13/Arrow 1.svg')),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,

    title: Text(title ?? '', style: Styles.style25),
  );
}
