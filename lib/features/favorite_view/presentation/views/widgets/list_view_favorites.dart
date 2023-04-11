import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:sala_app/core/app_widgets/my_divider.dart';
import 'package:sala_app/features/favorite_view/presentation/views/widgets/list_view_fav_item.dart';
import 'package:sala_app/features/home_view/data/favorite_model/favorites/favorites.model.dart';
import 'package:sala_app/features/home_view/presentation/view_models/home_data_cubit/home_data_cubit.dart';

class ListViewFavorites extends StatelessWidget {
  final FavoritesModel favoritesModel;
 final HomeDataState favState;

  const ListViewFavorites({super.key, required this.favoritesModel,required this.favState});
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: favState is ! FavoritesLoadingState,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListViewFavItem(
            product: favoritesModel.data!.data![index].product!,
          );
        },
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: MyDivider(
            margin: 20,
          ),
        ),
        itemCount: favoritesModel.data!.data!.length,
      ),
      fallback: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
