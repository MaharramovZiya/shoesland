import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textStyle,
    this.padding,
    this.borderRadius = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    final customSize = MediaQuery.of(context).size;
    return SizedBox(
      width: customSize.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding ?? const EdgeInsets.all(15),
          backgroundColor: color ?? Colours.blueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: GeneralTextWidget(
          text,

          textStyle: textStyle ??
              const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
        ),
      ),
    );
  }
}