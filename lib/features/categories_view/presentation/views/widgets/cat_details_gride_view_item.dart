import 'package:flutter/material.dart';
import 'package:sala_app/core/functions/navigation.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/core/utils/app_images.dart';
import 'package:sala_app/core/utils/styles.dart';
import 'package:sala_app/features/categories_view/data/models/categories_details_model/categories_datum.details.model.dart';
import 'package:sala_app/features/home_view/presentation/view_models/home_data_cubit/home_data_cubit.dart';
import 'package:sala_app/features/product_details_view/presentation/views/product_details_view.dart';

class CatDetailsGrideViewItem extends StatelessWidget {
  final ProductDataModel productModel;

  const CatDetailsGrideViewItem({super.key, required this.productModel});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(
            context: context,
            router: ProductDetailsView(productId: productModel.id!));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.grey[300]!, width: 1.5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    onPressed: () {
                      HomeDataCubit.get(context)
                          .changeIconFavorites(productId: productModel.id!);
                    },
                    icon: HomeDataCubit.get(context)
                            .favoriteList[productModel.id!]!
                        ? Icon(
                            Icons.favorite,
                          )
                        : Icon(
                            Icons.favorite_border,
                          ),
                    color: HomeDataCubit.get(context)
                            .favoriteList[productModel.id]!
                        ? Colors.red
                        : Colors.grey,
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Center(
                  child: Hero(
                    tag: productModel.id!,
                    child: FadeInImage(
                      placeholder: AssetImage(AppImages.load),
                      image: NetworkImage(productModel.image!),
                      width: 180,
                      height: 180,
                    ),
                  ),
                ),
                if (productModel.discount != 0)
                  Container(
                      color: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'DISCOUNT',
                        style: TextStyle(fontSize: 8, color: Colors.white),
                      )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.name ?? 'name',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle15.copyWith(height: 1.3),
                  ),
                  Row(
                    children: [
                      Text(
                        productModel.price == null
                            ? '1000'
                            : '${productModel.price!.round()}',
                        style: Styles.textStyle18
                            .copyWith(color: AppColors.kPrimaryColor),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      if (productModel.discount != 0)
                        Text(
                            productModel.oldPrice == null
                                ? '50'
                                : '${productModel.oldPrice!.round()}\$',
                            style: Styles.textStyle12),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
