import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala_app/core/functions/show_toast.dart';
import 'package:sala_app/features/home_view/presentation/view_models/home_data_cubit/home_data_cubit.dart';
import 'package:sala_app/features/home_view/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeDataCubit, HomeDataState>(
      builder: (context, state) {
        return ConditionalBuilder(
          condition: HomeDataCubit.get(context).homeModel != null &&
              HomeDataCubit.get(context).categoryModel != null,
          builder: (context) => HomeViewBody(
            homeModel: HomeDataCubit.get(context).homeModel!,
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      listener: (context, state) {
        if (state is ChangeFavoritesSuccessState) {
          if (state.changeIconeFavoriteModel.status) {
            showToast(
                message: state.changeIconeFavoriteModel.message,
                state: ToastStates.SUCCESS);
          }else{
            showToast(
                message: state.changeIconeFavoriteModel.message,
                state: ToastStates.ERROR);
          }
        }
      },
    );
  }
}
