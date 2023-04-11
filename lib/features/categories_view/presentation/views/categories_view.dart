import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala_app/features/categories_view/data/models/category_model/category.model.dart';
import 'package:sala_app/features/categories_view/presentation/views/widgets/categories_view_body.dart';
import 'package:sala_app/features/home_view/presentation/view_models/home_data_cubit/home_data_cubit.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    HomeDataCubit homeCubit = HomeDataCubit.get(context);
    CategoryModel? categoryModel = homeCubit.categoryModel;
    return BlocConsumer<HomeDataCubit, HomeDataState>(
      builder: (context, state) {
        return ConditionalBuilder(
            condition: categoryModel != null,
            builder: (context) =>
                CategoriesViewBody(categoryModel: categoryModel!),
            fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ));
      },
      listener: (context, state) {
        if (state is HomeDataInitial) print('intial state');
      },
    );
  }
}
