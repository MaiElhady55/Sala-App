import 'package:flutter/material.dart';
import 'package:sala_app/features/home_view/data/home_model/home.model.dart';
import 'package:sala_app/features/home_view/presentation/views/widgets/product_gride_view_item.dart';

class ProductsGrideView extends StatelessWidget {
  final HomeModel homeModel;

  const ProductsGrideView({super.key, required this.homeModel});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        padding: EdgeInsets.symmetric(horizontal: 8),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
        childAspectRatio: 1 / 2,
        children: List.generate(
            homeModel.data!.products!.length,
            (index) => ProductGrideViewItem(
                productModel: homeModel.data!.products![index])));
  }
}
