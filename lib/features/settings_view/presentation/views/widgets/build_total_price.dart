import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/core/utils/styles.dart';
import 'package:sala_app/features/cart_view/data/models/cart/cart.model.dart';

class BuildTotlaPrice extends StatelessWidget {
  final CartModel cartModel;

  const BuildTotlaPrice({super.key, required this.cartModel});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: Colors.grey[300]!, width: 3),
            color: AppColors.kPrimaryColor, // Color(0xFFFFFFFF), //ThemeAppCubit.get(context).IsDark ? HexColor('333739'):Colors.white,
            boxShadow:const [
              BoxShadow(
                  blurRadius: 1, color: Color(0xFF8D8E98), spreadRadius: 1.1),
            ],
          ),
          child: Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 25, bottom: 10.0, right: 25.0),
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total  ',
                      style: Styles.textStyle22
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text('\$  ${cartModel.data!.total}',
                        style: Styles.textStyle22
                            .copyWith(fontWeight: FontWeight.bold)),
                  ]))),
    );
  }
}
