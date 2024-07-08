import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesland/logic/blocs/bloc/onboarding_bloc.dart';
import 'package:shoesland/presentation/screens/onboarding/widgets/onboard_pageview_widget.dart';
import 'package:shoesland/presentation/screens/onboarding/widgets/page_indicator_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return Scaffold(
      body: BlocProvider(
        create: (context) => OnboardingBloc(),
        child: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            return Column(
              children: [

                //Page view in the here have all comments with descriptions
                OnboardPageViewWidget(pageController: pageController),
                const SizedBox(
                  height: 40,
                ),
                //Indicator and Button in row
                PageIndicatorWidget(pageController: pageController),
              ],
            );
          },
        ),
      ),
    );
  }
}

