import 'package:flutter/material.dart';
import 'package:sala_app/core/app_widgets/custom_arrow_back.dart';
import 'package:sala_app/core/app_widgets/custom_title_appbar.dart';
import 'package:sala_app/features/cart_view/presentation/view_models/get_cart_cubit/cart_cubit.dart';
import 'package:sala_app/features/settings_view/presentation/views/widgets/payment_view_body.dart';
import 'package:sala_app/features/settings_view/presentation/views/widgets/payment_view_null_body.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    var cartCubit = CartCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomTitleAppBar(title: 'Payments'),
        centerTitle: true,
        leading: CustomArrowBack(),
      ),
      body: cartCubit.cartModel == null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Center(
                child: const CircularProgressIndicator(),
              ),
            )
          : cartCubit.cartModel!.data!.cartItems!.isEmpty
              ? PaymentViewBodyNull()
              : PayMentViewBody(),
    );
  }
}
