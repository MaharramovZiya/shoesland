import 'package:flutter/material.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

// ignore: non_constant_identifier_names
Widget AccountController({
  required String promptText,
  required String actionText,
  required VoidCallback onActionPressed,
  TextStyle? promptTextStyle,
  TextStyle? actionTextStyle,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GeneralTextWidget(
        promptText,
        textStyle: promptTextStyle ??
            const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
      ),
      TextButton(
        onPressed: onActionPressed,
        child: GeneralTextWidget(
          actionText,
          textStyle: actionTextStyle ??
              const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    ],
  );
}
