import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/data/models/onboard_model.dart';
import 'package:shoesland/logic/blocs/onboarding_bloc/onboarding_bloc.dart';
import 'package:shoesland/presentation/routes/routes.dart';
import 'package:shoesland/presentation/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SmoothPageIndicator(
                effect: const ExpandingDotsEffect(
                  dotWidth: 15,
                  dotHeight: 8,
                  spacing: 10,
                  activeDotColor: Colors.blue,
                  dotColor: Colours.bgNikeTxtColor,
                ),
                controller: _pageController,
                count: onboardList.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 17),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                width: CustomSize(context).width / 2.2,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 0),
                    child: CustomButton(
                        text: state.currentPage == onboardList.length - 1
                            ? LocalStrings().onboardingGetStarted
                            : LocalStrings().onboardNext,
                        onPressed: () {
                          final currentIndex =
                              context.read<OnboardingBloc>().state.currentPage;
                          if (currentIndex == onboardList.length - 1) {
                            //nav

                            Get.toNamed(Routes.bottomNavigationBar);
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        })),
              ),
            ),
          ],
        );
      },
    );
  }
}
