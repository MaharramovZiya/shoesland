
import 'package:flutter/material.dart';
import 'package:shoesland/data/models/onboard_model.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

class OnboardingDisplayImagesWidget extends StatelessWidget {
  const OnboardingDisplayImagesWidget({
    super.key,
    required this.onboardItem,
  });

  final OnboardModel onboardItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.rotate(
            angle: -5 * 3.1415926535 / 90,
            child: Image.asset(
              onboardItem.image,
              fit: BoxFit.cover,
              width: 350,
              filterQuality: FilterQuality.high,
            ),
          ),
          const SizedBox(
            height: 120,
          ),
          GeneralTextWidget(
            onboardItem.title,
            textStyle: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          GeneralTextWidget(
            onboardItem.subtitle,
            textStyle: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
