import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/core/utils/app_images.dart';
import 'package:sala_app/core/utils/size_config.dart';
import 'package:sala_app/core/utils/styles.dart';
import 'package:sala_app/features/home_view/data/favorite_model/favorites/product.model.dart';
import 'package:sala_app/features/home_view/presentation/view_models/home_data_cubit/home_data_cubit.dart';

class ListViewFavItem extends StatelessWidget {
  final Product product;
  const ListViewFavItem({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height(context) * 0.20,
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 55.0,
                    child: FadeInImage(
                      placeholder: AssetImage(AppImages.load),
                      image: NetworkImage(product.image!),
                      width: 80,
                      height: 80,
                    ),
                  ),
                ],
              ),
              if (product.discount != 0)
                Container(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(fontSize: 8.0, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(product.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle16),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    ' ${product.price}\$',
                    style: Styles.textStyle18
                        .copyWith(color: AppColors.kPrimaryColor),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  if (product.discount != 0)
                    Text("${product.oldPrice}\$",
                        style: Styles.textStyle12),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        HomeDataCubit.get(context).changeIconFavorites(
                            productId: product.id!);
                      },
                      icon:HomeDataCubit.get(context).favoriteList[product.id!]!? Icon(
                        Icons.favorite,
                        size: 30,
                      ):Icon(Icons.favorite_border,size: 30,),
                      color: HomeDataCubit.get(context).favoriteList[product.id]!?Colors.red:Colors.grey,
                      ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
