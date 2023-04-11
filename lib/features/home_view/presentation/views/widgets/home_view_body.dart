import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/size_config.dart';
import 'package:sala_app/features/home_view/data/home_model/home.model.dart';
import 'package:sala_app/features/home_view/presentation/view_models/home_data_cubit/home_data_cubit.dart';
import 'package:sala_app/features/home_view/presentation/views/widgets/category_list_view.dart';
import 'package:sala_app/features/home_view/presentation/views/widgets/custom_carousel_slider.dart';
import 'package:sala_app/features/home_view/presentation/views/widgets/custom_row.dart';
import 'package:sala_app/features/home_view/presentation/views/widgets/product_gride_view.dart';
import 'package:sala_app/features/home_view/presentation/views/widgets/smooth_home_indicator.dart';

class HomeViewBody extends StatelessWidget {
  final HomeModel homeModel;

  const HomeViewBody({super.key, required this.homeModel});

  @override
  Widget build(BuildContext context) {
    HomeDataCubit homeCubit = HomeDataCubit.get(context);
    var categoryModel = homeCubit.categoryModel;
    var productModel = homeCubit.homeModel;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: SizeConfig.height(context) * 0.02),
          CustomCarouselSlider(
            bannerList: homeModel.data!.banners!,
          ),
          SizedBox(height: SizeConfig.height(context) * 0.04),
          SmoothHomeIndicator(homeModel: homeModel),
          SizedBox(height: SizeConfig.height(context) * 0.043),
          CustomRow(
            title: 'Category',
            subTitl: 'see all',
            function: () {},
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.height(context) * 0.024),
            child: CategoryListView(categoryModel: categoryModel),
          ),
          CustomRow(title: 'Product'),
          SizedBox(height: SizeConfig.height(context)*0.017,),
          ProductsGrideView(
            homeModel: productModel!,
          ),
        ],
      ),
    );
  }
}




