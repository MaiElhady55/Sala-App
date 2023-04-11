import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/core/utils/app_images.dart';
import 'package:sala_app/core/utils/size_config.dart';
import 'package:sala_app/core/utils/styles.dart';
import 'package:sala_app/features/cart_view/data/models/cart/cart_item.model.dart';
import 'package:sala_app/features/cart_view/presentation/view_models/get_cart_cubit/cart_cubit.dart';
import 'package:sala_app/features/cart_view/presentation/views/widgets/custom_raw_material_button.dart';

class ListViewCartItem extends StatelessWidget {
  final CartItem cartItem;
  final int index;

  const ListViewCartItem(
      {super.key, required this.cartItem, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height(context) * 0.20,
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 55.0,
                    child: FadeInImage(
                      placeholder: AssetImage(AppImages.load),
                      image: NetworkImage(cartItem.product!.image!),
                      width: 80,
                      height: 80,
                    ),
                  ),
                ],
              ),
              if (cartItem.product!.discount != 0)
                Container(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(fontSize: 8.0, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(cartItem.product!.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle16),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    ' ${cartItem.product!.price}\$',
                    style: Styles.textStyle18
                        .copyWith(color: AppColors.kPrimaryColor),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  if (cartItem.product!.discount != 0)
                    Text("${cartItem.product!.oldPrice}\$",
                        style: Styles.textStyle12),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Spacer(),
                  CustomRowMaterialButton(
                      icon: Icons.add,
                      fun: () async {
                        CartCubit.get(context).plusQuantity(
                            CartCubit.get(context).cartModel!, index);
                        CartCubit.get(context).updateCardData(
                          id: CartCubit.get(context)
                              .cartModel!
                              .data!
                              .cartItems![index]
                              .id
                              .toString(),
                          quantity: CartCubit.get(context).quantity,
                        );
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      CartCubit.get(context)
                          .cartModel!
                          .data!
                          .cartItems![index]
                          .quantity
                          .toString(),
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                  CustomRowMaterialButton(
                      icon: Icons.remove,
                      fun: ()  {
                        CartCubit.get(context).minusQuantity(
                            CartCubit.get(context).cartModel!, index);
                        CartCubit.get(context).updateCardData(
                            id: CartCubit.get(context)
                                .cartModel!
                                .data!
                                .cartItems![index]
                                .id
                                .toString(),
                            quantity: CartCubit.get(context).quantity);
                      }),
                  IconButton(
                      onPressed: () {
                        CartCubit.get(context)
                            .changeCart(productId: cartItem.product!.id!);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 37,
                      ))
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
