import 'package:flutter/material.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

class AuthCustomTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  const AuthCustomTitle({
    Key? key,
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GeneralTextWidget(
          title,
          textStyle: titleStyle ??
              const TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
        ),
        GeneralTextWidget(
          subtitle,
          textAlign: TextAlign.center,
          textStyle: subtitleStyle ??
              const TextStyle(fontWeight: FontWeight.w200, fontSize: 16),
        ),
      ],
    );
  }
}
