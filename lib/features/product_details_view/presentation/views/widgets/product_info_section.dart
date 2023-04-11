import 'package:flutter/material.dart';
import 'package:sala_app/core/app_widgets/my_divider.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/core/utils/size_config.dart';
import 'package:sala_app/core/utils/styles.dart';
import 'package:sala_app/features/product_details_view/data/models/product_details_model.dart';

class ProductInfoSection extends StatelessWidget {
  final ProductDetailsmodel productDetailsmodel;

  const ProductInfoSection({super.key, required this.productDetailsmodel});

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.width(context);
    var height = SizeConfig.width(context);
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.grey[200]!.withOpacity(0.8),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(top: 16, right: 8, left: 8, bottom: height / 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productDetailsmodel.data!.name,
              style: Styles.textStyle18.copyWith(color: Colors.black),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${productDetailsmodel.data!.price.round()}\$',
                  style: Styles.textStyle18
                      .copyWith(color: AppColors.kPrimaryColor),
                ),
                SizedBox(
                  width: 15,
                ),
                if (productDetailsmodel.data!.discount != 0)
                  Text('${productDetailsmodel.data!.oldPrice!.round()}\$',
                      style: Styles.textStyle12),
                Spacer(),
                if (productDetailsmodel.data!.discount != 0)
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Text(
                      '${productDetailsmodel.data!.discount}% Off',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: MyDivider(
                margin: 10,
              ),
            ),
            Text(
              'Description',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              productDetailsmodel.data!.description,
              style: TextStyle(color: Colors.grey[800]),
            ),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
