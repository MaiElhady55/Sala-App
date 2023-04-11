import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/app_images.dart';
import 'package:sala_app/features/home_view/data/home_model/banner.model.dart';
import 'package:sala_app/features/home_view/presentation/view_models/home_data_cubit/home_data_cubit.dart';

class CustomCarouselSlider extends StatelessWidget {
  final List<BannerModel> bannerList;

  const CustomCarouselSlider({super.key, required this.bannerList});
  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeDataCubit.get(context);
    return CarouselSlider.builder(
        itemCount: bannerList.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            child: FadeInImage(
              placeholder: AssetImage(AppImages.load),
              image: NetworkImage(
                bannerList[index].image!,
              ),
              fit: BoxFit.cover,
            ),
          );
        },
        options: CarouselOptions(
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          aspectRatio: 16 / 9,
          viewportFraction: 0.9,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            homeCubit.changeindexCarouselSider(index);
          },
        ));
  }
}
