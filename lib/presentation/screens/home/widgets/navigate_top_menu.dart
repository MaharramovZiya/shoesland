import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/colours.dart';

class NavigateTopMenu extends StatelessWidget {
  const NavigateTopMenu(
      {super.key,
      this.trallingIcon,
      required this.leadingIcon,
      required this.leadingOnPressed,
      this.trallingOnPressed,

      required this.title,
      this.customWidget});
  final IconData leadingIcon;
  final IconData? trallingIcon;
  final VoidCallback leadingOnPressed;
  final VoidCallback? trallingOnPressed;
  final String title;
  final Widget? customWidget;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Colours.white,
            child: IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)),
          ),
        ),

        //Store location

        Column(
          children: [
            // if (customWidget != null) customWidget!,
            Text(title),
          ],
        ),

        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Colours.white,
            child: IconButton(onPressed: trallingOnPressed, icon: Icon(trallingIcon)),
          ),
        ),
      ],
    );
  }
}
