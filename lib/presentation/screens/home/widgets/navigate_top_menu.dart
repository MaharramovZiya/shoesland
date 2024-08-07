import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/colours.dart';

class NavigateTopMenu extends StatelessWidget {
  const NavigateTopMenu({
    super.key,
    this.trallingIcon,
    required this.leadingIcon,
    required this.leadingOnPressed,
    this.trallingOnPressed,
    required this.title,
    this.customWidget,
  });

  final IconData leadingIcon;
  final Widget? trallingIcon;
  final VoidCallback leadingOnPressed;
  final VoidCallback? trallingOnPressed;
  final String title;
  final Widget? customWidget;

  @override
  Widget build(BuildContext context) {
    bool isDiffWidget = trallingIcon is Text || trallingIcon is Row;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Colours.white,
            child: IconButton(
              onPressed: leadingOnPressed,
              icon: Icon(
                leadingIcon,
                size: 20,
              ),
            ),
          ),
        ),
        Column(
          children: [
            if (customWidget != null) customWidget!,
            Row(
              children: [
                if (customWidget != null)
                  const Icon(
                    Icons.location_on,
                    color: Colors.orange,
                  ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
        if (trallingOnPressed != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              color: isDiffWidget ? Colors.transparent : Colours.white,
              child: IconButton(
                onPressed: trallingOnPressed,
                icon: trallingIcon ?? Container(),
              ),
            ),
          ),
      ],
    );
  }
}
