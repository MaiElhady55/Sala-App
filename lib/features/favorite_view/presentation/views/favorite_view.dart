import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala_app/core/functions/show_toast.dart';
import 'package:sala_app/features/favorite_view/presentation/views/favorite_view_body.dart';
import 'package:sala_app/features/favorite_view/presentation/views/widgets/favorite_view_null_body.dart';
import 'package:sala_app/features/home_view/presentation/view_models/home_data_cubit/home_data_cubit.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeDataCubit, HomeDataState>(
      builder: (context, state) {
        var homeCubit = HomeDataCubit.get(context);
        return Scaffold(
          body: homeCubit.favoritesModel == null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Center(
                    child: const CircularProgressIndicator(),
                  ),
                )
              : homeCubit.favoritesModel!.data!.data!.isEmpty
                  ? FavoriteViewNullBody()
                  : FavoriteViwBody(
                    favoritesModel: homeCubit.favoritesModel!,
                    favStete: state,
                  ),
        );
      },
      listener: (context, state) {
        if (state is ChangeFavoritesSuccessState) {
          if (state.changeIconeFavoriteModel.status) {
            showToast(
                message: state.changeIconeFavoriteModel.message,
                state: ToastStates.SUCCESS);
          } else {
            showToast(
                message: state.changeIconeFavoriteModel.message,
                state: ToastStates.ERROR);
          }
        }
      },
    );
  }
}
