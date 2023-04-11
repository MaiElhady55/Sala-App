import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala_app/features/categories_view/presentation/view_models/cubit/categoies_details_cubit.dart';
import 'package:sala_app/features/categories_view/presentation/views/widgets/categories_details_gride_view.dart';

class CategoriesDetailsViewBody extends StatelessWidget {
  const CategoriesDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    CategoiesDetailsCubit catCubit = CategoiesDetailsCubit.get(context);

    return BlocConsumer<CategoiesDetailsCubit, CategoiesDetailsState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        if (state is CategoiesDetailsSuccess) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CategoriesDetailsGrideView(catCubit: catCubit),
          );
        } else if (state is CategoiesDetailsFailure) {
          return Text(state.errMessage);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
