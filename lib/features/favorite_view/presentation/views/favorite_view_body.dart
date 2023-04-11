import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/size_config.dart';
import 'package:sala_app/features/favorite_view/presentation/views/widgets/list_view_favorites.dart';
import 'package:sala_app/features/home_view/data/favorite_model/favorites/favorites.model.dart';
import 'package:sala_app/features/home_view/presentation/view_models/home_data_cubit/home_data_cubit.dart';

class FavoriteViwBody extends StatelessWidget {
  final FavoritesModel favoritesModel;
  final HomeDataState favStete;

  const FavoriteViwBody({super.key, required this.favoritesModel,required this.favStete});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.height(context) * 0.020,
          ),
          ListViewFavorites(
            favoritesModel: favoritesModel,favState: favStete,
          ),
        ],
      ),
    );
  }
}
