import 'package:flutter/material.dart';
import 'package:sala_app/features/home_view/data/home_model/home.model.dart';
import 'package:sala_app/features/home_view/presentation/view_models/home_data_cubit/home_data_cubit.dart';
import 'package:sala_app/features/onboarding_view/presentation/views/widgets/smooth_indicator.dart';

class SmoothHomeIndicator extends StatelessWidget {
  final HomeModel homeModel;

  const SmoothHomeIndicator({super.key, required this.homeModel});

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeDataCubit.get(context);
    return Center(
      child: SmoothBoardingIndicator(
          boarding: homeModel.data!.banners!,
          width: 15,
          height: 15,
          spacing: 10,
          factory: 3,
          pageController:
              PageController(initialPage: homeCubit.indexCarouselSider)),
    );
  }
}
