import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/size_config.dart';
import 'package:sala_app/features/cart_view/data/models/cart/cart.model.dart';
import 'package:sala_app/features/cart_view/presentation/views/widgets/custom_total_price.dart';
import 'package:sala_app/features/cart_view/presentation/views/widgets/list_view_cart.dart';

class CartViewBody extends StatelessWidget {
  final CartModel cartModel;

  const CartViewBody({super.key, required this.cartModel});
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.height(context);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: height / 1,
          child: Padding(
            padding: EdgeInsets.only(
              top: 16.0,
              right: 16.0,
              left: 16.0,
              bottom: MediaQuery.of(context).size.height / 8,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListViewCarts(cartModel: cartModel,),
                ],
              ),
            ),
          ),
        ),
        CustomTotalPrice(
          cartDataModel:cartModel.data! ,
        )
      ],
    );
  }
}
