import 'package:flutter/material.dart';
import 'package:sala_app/core/functions/navigation.dart';
import 'package:sala_app/core/utils/size_config.dart';
import 'package:sala_app/features/categories_view/data/models/category_model/category.model.dart';
import 'package:sala_app/features/categories_view/presentation/view_models/cubit/categoies_details_cubit.dart';
import 'package:sala_app/features/categories_view/presentation/views/categories_details_view.dart';
import 'package:sala_app/features/home_view/presentation/views/widgets/category_list_view_item.dart';

class CategoryListView extends StatelessWidget {
  final CategoryModel? categoryModel;

  const CategoryListView({super.key, required this.categoryModel});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: SizeConfig.height(context) * 0.085,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.height(context) * 0.015),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: categoryModel!.data!.data!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.height(context) * 0.01),
                child: InkWell(
                  onTap: () {
                    CategoiesDetailsCubit.get(context).getCategoriesDetails(
                        categoryId: categoryModel!.data!.data![index].id!);
                    navigateTo(
                        context: context,
                        router: CategoriesDetailsView(
                          catName: categoryModel!.data!.data![index].name!,
                        ));
                  },
                  child: CategoryListViewItem(
                      categoryDatumModel: categoryModel!.data!.data![index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
