import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stag_shopping/src/authentication/presentation/widgets/pages.dart';

import '../../../../../config/themes/colors.dart';
import '../../blocs/onboarding/onboarding_bloc.dart';

class OnboardingPage extends StatelessWidget {
  static const String routeName = "/";
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const OnboardingPage(),
    );
  }

  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: 0);
    return Scaffold(
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                scrollDirection: Axis.horizontal,
                controller: pageController,
                onPageChanged: (value) {
                  state.page = value;
                  context.read<OnboardingBloc>().add(OnboardingEvent());
                },
                children: [
                  pages(
                    1,
                    context,
                    "assets/png/shopping_1.png",
                    "Get Ready to Shop",
                    "We're thrilled to have you on board and make your shopping experience easier and more enjoyable than ever before. Let's get started!",
                    "Next",
                    pageController,
                  ),
                  pages(
                    2,
                    context,
                    "assets/png/shopping_9.png",
                    "Get Ready to Shop",
                    "We're thrilled to have you on board and make your shopping experience easier and more enjoyable than ever before. Let's get started!",
                    "Next",
                    pageController,
                  ),
                  pages(
                    3,
                    context,
                    "assets/png/shopping_4.png",
                    "Get Ready to Shop",
                    "We're thrilled to have you on board and make your shopping experience easier and more enjoyable than ever before. Let's get started!",
                    "Let's Go",
                    pageController,
                  ),
                ],
              ),
              Positioned(
                bottom: 130.h,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: state.page,
                  decorator: DotsDecorator(
                    color: Colors.grey,
                    activeColor: Colours.skyBlue,
                    size: const Size.square(8.0),
                    activeSize: const Size(16.0, 8.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
