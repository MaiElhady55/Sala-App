import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sala_app/core/app_widgets/my_divider.dart';
import 'package:sala_app/features/cart_view/data/models/cart/cart.model.dart';
import 'package:sala_app/features/cart_view/presentation/views/widgets/list_view_cart_item.dart';

class ListViewCarts extends StatelessWidget {
  final CartModel cartModel;

  const ListViewCarts({super.key, required this.cartModel});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListViewCartItem(cartItem:cartModel.data!.cartItems![index],index: index,);
        },
        separatorBuilder: (context, index) => MyDivider(),
        itemCount: cartModel.data!.cartItems!.length);
  }
}
