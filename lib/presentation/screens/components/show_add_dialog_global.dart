import 'package:flutter/material.dart';

void showCustomAddToCartDialog(BuildContext context, Widget child) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return child;
    },
  );
}
