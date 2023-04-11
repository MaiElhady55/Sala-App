import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/core/utils/app_images.dart';
import 'package:sala_app/core/utils/size_config.dart';
import 'package:sala_app/core/utils/styles.dart';
import 'package:sala_app/features/categories_view/data/models/category_model/datum.model.dart';

class CategoryCardItem extends StatelessWidget {
  final CategoryDatumModel model;

  const CategoryCardItem({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FadeInImage(
          placeholder: AssetImage(AppImages.load),
          image: NetworkImage("${model.image}"),
          width: SizeConfig.width(context) / 3.5,
          fit: BoxFit.cover,
        ),
        /*Image(
          image: NetworkImage("${model.image}"),
          fit: BoxFit.cover,
          width: SizeConfig.width(context) / 3.5,
          //height: MediaQuery.of(context).size.height / 5,
        ),*/
        SizedBox(
          width: 10,
        ),
        Text(" ${model.name}",
            style: Styles.textStyle18.copyWith(color: Colors.black)),
        Spacer(),
        InkWell(
            onTap: () {},
            child:
                Icon(Icons.arrow_forward_ios, color: AppColors.kPrimaryColor)),
      ],
    );
  }
}
