import 'package:flutter/material.dart';
import 'package:sala_app/features/categories_view/data/models/category_model/category.model.dart';
import 'package:sala_app/features/categories_view/presentation/views/widgets/categories_card_list_view.dart';

class CategoriesViewBody extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoriesViewBody({super.key, required this.categoryModel});
  @override
  Widget build(BuildContext context) {
    return CategoriesCardListView(categoryModel: categoryModel);
  }
}
