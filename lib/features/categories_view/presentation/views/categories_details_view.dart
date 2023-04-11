import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala_app/core/app_widgets/custom_arrow_back.dart';
import 'package:sala_app/core/app_widgets/custom_title_appbar.dart';
import 'package:sala_app/features/categories_view/presentation/view_models/cubit/categoies_details_cubit.dart';
import 'package:sala_app/features/categories_view/presentation/views/widgets/categories_details_view_body.dart';

class CategoriesDetailsView extends StatelessWidget {
  final String catName;

  const CategoriesDetailsView({super.key, required this.catName});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoiesDetailsCubit, CategoiesDetailsState>(
      builder: (context, state) {
        CategoiesDetailsCubit categoryCubit =
            CategoiesDetailsCubit.get(context);  
        return ConditionalBuilder(
            condition: categoryCubit.categoriesDetailsModel != null,
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    centerTitle: true,
                    title: CustomTitleAppBar(
                      title: catName,
                    ),
                    leading: CustomArrowBack(),
                  ),
                  body: CategoriesDetailsViewBody(),
                ),
            fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ));
      },
      listener: (context, state) {},
    );
  }
}
