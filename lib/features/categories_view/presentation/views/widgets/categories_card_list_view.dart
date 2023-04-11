import 'package:flutter/material.dart';
import 'package:sala_app/core/functions/navigation.dart';
import 'package:sala_app/features/categories_view/data/models/category_model/category.model.dart';
import 'package:sala_app/features/categories_view/presentation/view_models/cubit/categoies_details_cubit.dart';
import 'package:sala_app/features/categories_view/presentation/views/categories_details_view.dart';
import 'package:sala_app/features/categories_view/presentation/views/widgets/categories_card_item.dart';

class CategoriesCardListView extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoriesCardListView({super.key, required this.categoryModel});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: InkWell(
              onTap: () {
                CategoiesDetailsCubit.get(context).getCategoriesDetails(
                    categoryId: categoryModel.data!.data![index].id!);
                navigateTo(context: context, router: CategoriesDetailsView(
                 catName: categoryModel.data!.data![index].name!,));
              },
              child: Container(
                  height: 120,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(width: 1, color: Colors.grey[300]!),
                  ),
                  child: CategoryCardItem(
                      model: categoryModel.data!.data![index])),
            ),
          );
        },
        separatorBuilder: ((context, index) => SizedBox.shrink()),
        itemCount: categoryModel.data!.data!.length);
  }
}
