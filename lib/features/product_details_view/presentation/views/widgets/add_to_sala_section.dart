import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/core/utils/size_config.dart';
import 'package:sala_app/core/utils/styles.dart';
import 'package:sala_app/features/cart_view/presentation/view_models/get_cart_cubit/cart_cubit.dart';
import 'package:sala_app/features/product_details_view/data/models/product_details_model.dart';
import 'package:sala_app/features/settings_view/presentation/view_models/theme_cubit/themeapp_cubit.dart';

class AddToSalaSection extends StatelessWidget {
  final ProductDetailsmodel productDetailsmodel;

  const AddToSalaSection({super.key, required this.productDetailsmodel});
  @override
  Widget build(BuildContext context) {
    var cartCubit = CartCubit.get(context);
    var width = SizeConfig.width(context);
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
        color: ThemeappCubit.get(context).isDark
            ? HexColor('333739')
            : Colors.white,
        boxShadow: const [
          BoxShadow(blurRadius: 1, color: Color(0xFF8D8E98), spreadRadius: 0.1),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 14.0, left: 25, bottom: 15.0, right: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                cartCubit.changeCart(productId: productDetailsmodel.data!.id);
                print('ID ${productDetailsmodel.data!.id}');
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.kPrimaryColor),
                width: 250.0,
                height: 46,
                child: Center(
                  child: (Text(
                    (productDetailsmodel.data!.inCart.toString() == 'true')
                        ? 'REMOVE FROM SALA'
                        : 'ADD TO SALA',
                    style: Styles.textStyle18.copyWith(color: Colors.black),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
