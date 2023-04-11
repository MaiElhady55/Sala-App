import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/core/utils/size_config.dart';
import 'package:sala_app/core/utils/styles.dart';
import 'package:sala_app/features/categories_view/data/models/category_model/datum.model.dart';

class CategoryListViewItem extends StatelessWidget {
  final CategoryDatumModel? categoryDatumModel;

  const CategoryListViewItem({super.key, required this.categoryDatumModel});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.height(context) * 0.018,
        vertical: SizeConfig.height(context) * 0.013,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.kPrimaryColor,
          )),
      child: Center(
        child: Text(
          '${categoryDatumModel!.name}',
          style: Styles.textStyle18.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
