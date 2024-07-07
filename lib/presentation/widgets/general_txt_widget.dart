import 'package:flutter/material.dart';

class GeneralTextWidget extends Text {
  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;

  // Constructor
  GeneralTextWidget(
    this.text, {
     Key? key,
    required this.textStyle,
    this.textAlign = TextAlign.left,
  }) : super(
          text,
          style: textStyle,
          textAlign: textAlign,
        );
}
