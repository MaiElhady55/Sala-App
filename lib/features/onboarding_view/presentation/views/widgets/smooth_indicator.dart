import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothBoardingIndicator extends StatelessWidget {
  final List<dynamic> boarding;
  final PageController pageController;
  final double height;
  final double width;
  final double spacing;
  final double factory;

  const SmoothBoardingIndicator(
      {super.key,
      required this.boarding,
      required this.pageController,
      this.height = 16,
      this.width = 16,
      this.spacing = 4,
      this.factory=4
      });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      count: boarding.length,
      controller: pageController,
      axisDirection: Axis.horizontal,
      effect: ExpandingDotsEffect(
        dotHeight: height,
        dotWidth: width,
        activeDotColor: AppColors.kPrimaryColor,
        dotColor: Colors.grey,
        spacing: spacing,
        expansionFactor: factory,
      ),
    );
  }
}
