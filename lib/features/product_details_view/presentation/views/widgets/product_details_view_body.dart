import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/size_config.dart';
import 'package:sala_app/features/product_details_view/data/models/product_details_model.dart';
import 'package:sala_app/features/product_details_view/presentation/views/widgets/add_to_sala_section.dart';
import 'package:sala_app/features/product_details_view/presentation/views/widgets/product_info_section.dart';

class ProductDetailsViewBody extends StatelessWidget {
  final ProductDetailsmodel productDetailsmodel;

  const ProductDetailsViewBody({super.key, required this.productDetailsmodel});
  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.width(context);
    var height = SizeConfig.height(context);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
          child: Container(
            height: height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Hero(
                      tag: productDetailsmodel.data!.id,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Center(
                            child: Image(
                              image:
                                  NetworkImage(productDetailsmodel.data!.image),
                              height: height / 3,
                            ),
                          ),
                          if (productDetailsmodel.data!.discount != 0)
                            Container(
                                color: Colors.red,
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  'DISCOUNT',
                                  style: TextStyle(
                                      fontSize: 9, color: Colors.white),
                                )),
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  ProductInfoSection(productDetailsmodel: productDetailsmodel),
                  SizedBox(
                    height:15,
                  ),
                ],
              ),
            ),
          ),
        ),
        AddToSalaSection(
          productDetailsmodel: productDetailsmodel,
        )
      ],
    );
  }
}

