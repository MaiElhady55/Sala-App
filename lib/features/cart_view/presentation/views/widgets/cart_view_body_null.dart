import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/features/cart_view/presentation/views/widgets/square.dart';

class CartViewBodyNull extends StatelessWidget {
  const CartViewBodyNull({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Your Cart list is empty .',
          style: TextStyle(color: AppColors.kPrimaryColor, fontSize: 20),
        ),
        SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            BounceInDown(duration: Duration(seconds: 3), child: Square()),
            BounceInUp(duration: Duration(seconds: 3), child: Square()),
            BounceInLeft(duration: Duration(seconds: 3), child: Square()),
            BounceInRight(duration: Duration(seconds: 3), child: Square()),
          ],
        ),
      ],
    ));
  }
}
