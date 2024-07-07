
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesland/data/models/onboard_model.dart';
import 'package:shoesland/logic/blocs/bloc/onboarding_bloc.dart';
import 'package:shoesland/presentation/screens/onboarding/widgets/onboard_background_image_widget.dart';
import 'package:shoesland/presentation/screens/onboarding/widgets/onboard_bg_text_widget.dart';
import 'package:shoesland/presentation/screens/onboarding/widgets/onboard_dot_widget.dart';

class OnboardPageViewWidget extends StatelessWidget {
  const OnboardPageViewWidget({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: _pageController,
        itemCount: onboardList.length,
        onPageChanged: (index) {
          context
              .read<OnboardingBloc>()
              .add(PageChangedEvent(index));
        },
        itemBuilder: (context, index) {
          final onboardItem = onboardList[index];
          return SizedBox(
            child: Stack(
              children: [
    
                //display dot
                const OnboardDisplayDotWidget(
                  top: 120,
                  left: 60,
                ),
                const OnboardDisplayDotWidget(
                  bottom: 215,
                  left: 15,
                ),
                const OnboardDisplayDotWidget(
                  bottom: 280,
                  right: 30,
                ),
                const  OnboardBackgroundTextWidget(),
                //Display shoes images
                OnboardingDisplayImagesWidget(onboardItem: onboardItem),
              ],
            ),
          );
        },
      ),
    );
  }
}