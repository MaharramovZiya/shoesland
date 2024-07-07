import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shoesland/config/routes.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/data/models/onboard_model.dart';
import 'package:shoesland/logic/blocs/bloc/onboarding_bloc.dart';
import 'package:shoesland/presentation/routes/routes.dart';
import 'package:shoesland/presentation/widgets/custom_button.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();
    return Scaffold(
      body: BlocProvider(
        create: (context) => OnboardingBloc(),
        child: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
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
                            Positioned(
                              top: 120,
                              left: 60,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  color: Colours.blueColor,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 215,
                              left: 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  color: Colours.blueColor,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 280,
                              right: 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  color: Colours.blueColor,
                                ),
                              ),
                            ),
                            Positioned.fill(
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
                            ),
                            Padding(
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
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
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
                      padding: EdgeInsets.only(right: 17),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        width: CustomSize(context).width / 2.2,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 0),
                            child: CustomButton(
                                text:
                                    state.currentPage == onboardList.length - 1
                                        ? LocalStrings().onboardingGetStarted
                                        : LocalStrings().onboardNext,
                                onPressed: () {
                                  final currentIndex = context
                                      .read<OnboardingBloc>()
                                      .state
                                      .currentPage;
                                  if (currentIndex == onboardList.length - 1) {
                                    //nav

                                    Get.toNamed(Routes.bottomNavigationBar);
                                  } else {
                                    _pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                })),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
