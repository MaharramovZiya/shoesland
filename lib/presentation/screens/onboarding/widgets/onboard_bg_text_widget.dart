
import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

class OnboardBackgroundTextWidget extends StatelessWidget {
  const OnboardBackgroundTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 100,
                  left: 10,
                  child: GeneralTextWidget(
                    LocalStrings().onboardingBgTxt,
                    textStyle: const TextStyle(
                        fontSize: 155,
                        color: Colours.bgNikeTxtColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
