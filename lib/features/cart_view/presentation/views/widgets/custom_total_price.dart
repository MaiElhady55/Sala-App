import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sala_app/core/functions/navigation.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/core/utils/size_config.dart';
import 'package:sala_app/core/utils/styles.dart';
import 'package:sala_app/features/cart_view/data/models/cart/cart.data.model.dart';
import 'package:sala_app/features/settings_view/presentation/view_models/theme_cubit/themeapp_cubit.dart';
import 'package:sala_app/features/settings_view/presentation/views/payment_view.dart';

class CustomTotalPrice extends StatelessWidget {
  final CartDataModel cartDataModel;

  const CustomTotalPrice({super.key, required this.cartDataModel});
  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.width(context);
    return Container(
      width: width,
      //height: 85.0,
      decoration: BoxDecoration(
        color: ThemeappCubit.get(context).isDark ? HexColor('333739'):Colors.white,
        boxShadow: const [
          BoxShadow(blurRadius: 1, color: Color(0xFF8D8E98), spreadRadius: 0.1),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 14.0, left: 25, bottom: 15.0, right: 18.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total',
                    style: Styles.textStyle16.copyWith(color: Colors.black)),
                Text('\$ ${cartDataModel.total}',
                    style: Styles.textStyle20),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                navigateTo(context: context,router:  PaymentView());
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: AppColors.kPrimaryColor),
                width: SizeConfig.width(context) * 0.46, //165.0,
                height: 46,
                padding: EdgeInsets.only(
                    top: 8.0, bottom: 8.0, right: 8.0, left: 24.0),
                child: Row(
                  children: [
                    Text(
                      'Check Out',
                      style: Styles.textStyle14white,
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.kPrimaryColor,
                        size: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
