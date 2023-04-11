import 'package:flutter/material.dart';
import 'package:sala_app/features/categories_view/data/models/categories_details_model/categories_datum.details.model.dart';
import 'package:sala_app/features/categories_view/presentation/view_models/cubit/categoies_details_cubit.dart';
import 'package:sala_app/features/categories_view/presentation/views/widgets/cat_details_gride_view_item.dart';

class CategoriesDetailsGrideView extends StatelessWidget {
  final CategoiesDetailsCubit catCubit;

  const CategoriesDetailsGrideView({super.key, required this.catCubit});
  @override
  Widget build(BuildContext context) {
    List<ProductDataModel> productList =
        catCubit.categoriesDetailsModel!.data!.productData!;

    return GridView.count(
        padding: EdgeInsets.symmetric(horizontal: 8),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
        childAspectRatio: 1 / 2,
        children: List.generate(
            productList.length,
            (index) =>
                CatDetailsGrideViewItem(productModel: productList[index])));
  }
}
