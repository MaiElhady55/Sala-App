import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala_app/core/app_widgets/custom_arrow_back.dart';
import 'package:sala_app/core/app_widgets/custom_title_appbar.dart';
import 'package:sala_app/core/functions/show_toast.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/features/cart_view/presentation/view_models/get_cart_cubit/cart_cubit.dart';
import 'package:sala_app/features/cart_view/presentation/views/widgets/cart_view_body.dart';
import 'package:sala_app/features/cart_view/presentation/views/widgets/cart_view_body_null.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return BlocConsumer<CartCubit, CartState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: CustomTitleAppBar(title: 'Cart'),
              centerTitle: true,
              leading: CustomArrowBack(),
              /*actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16,top: 6),
                  child: Badge(
                    badgeContent: Text(CartCubit.get(context).cartModel!.data!.cartItems!.length.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 12),),
                    child: Icon(Icons.shopping_cart,color: AppColors.kPrimaryColor,size: 30,),
                  ),
                )
              ],*/
            ),
            body: cartCubit.cartModel == null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Center(child: const CircularProgressIndicator()))
                : cartCubit.cartModel!.data!.cartItems!.isEmpty
                    ? CartViewBodyNull()
                    : CartViewBody(cartModel: cartCubit.cartModel!,));
      },
      listener: (context, state) {
        if (state is ChangeCartSuccessState) {
          if (state.changeCartsModel.status) {
            showToast(
                message: state.changeCartsModel.message,
                state: ToastStates.SUCCESS);
          } else {
            showToast(
                message: state.changeCartsModel.message,
                state: ToastStates.ERROR);
          }
        }
      },
    );
  }
}
