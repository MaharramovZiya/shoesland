import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAllPressed;

  const SectionHeader({
    required this.onSeeAllPressed,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GeneralTextWidget(
          title,
          textStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: onSeeAllPressed,
          child: GeneralTextWidget(
            LocalStrings().seeAll,
            textStyle: const TextStyle(
              color: Colours.blueColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
