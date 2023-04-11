import 'package:flutter/material.dart';
import 'package:sala_app/core/functions/navigation.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/core/utils/app_images.dart';
import 'package:sala_app/core/utils/size_config.dart';
import 'package:sala_app/core/utils/styles.dart';
import 'package:sala_app/features/home_view/presentation/view_models/home_data_cubit/home_data_cubit.dart';
import 'package:sala_app/features/product_details_view/presentation/views/product_details_view.dart';
import 'package:sala_app/features/search_view/data/search/datum.model.dart';

class BuildListItem extends StatelessWidget {
  final ProductSearch productSearch;

  const BuildListItem({
    super.key,
    required this.productSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: () {
          navigateTo(
              context: context,
              router: ProductDetailsView(
                productId: productSearch.id!,
              ));
        },
        child: Container(
          height: SizeConfig.height(context) * 0.20,
          padding:
              EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
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
                        radius: 65.0,
                        child: FadeInImage(
                          placeholder: AssetImage(AppImages.load),
                          image: NetworkImage(productSearch.image!),
                          width: 90,
                          height: 90,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${productSearch.name}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle15.copyWith(height: 1.3),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(productSearch.price.toString(),
                            style: Styles.textStyle18
                                .copyWith(color: AppColors.kPrimaryColor)),
                        SizedBox(
                          width: 5.0,
                        ),
                        Spacer(),
                        IconButton(
                      onPressed: () {
                        HomeDataCubit.get(context).changeIconFavorites(
                            productId: productSearch.id!);
                      },
                      icon:HomeDataCubit.get(context).favoriteList[productSearch.id!]!? Icon(
                        Icons.favorite,
                        size: 30,
                      ):Icon(Icons.favorite_border,size: 30,),
                      color: HomeDataCubit.get(context).favoriteList[productSearch.id]!?Colors.red:Colors.grey,
                      ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
