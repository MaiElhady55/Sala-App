import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sala_app/core/app_widgets/main_button.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/core/utils/size_config.dart';
import 'package:sala_app/core/utils/styles.dart';
import 'package:sala_app/features/cart_view/presentation/view_models/get_cart_cubit/cart_cubit.dart';
import 'package:sala_app/features/settings_view/presentation/view_models/theme_cubit/themeapp_cubit.dart';
import 'package:sala_app/features/settings_view/presentation/views/widgets/build_total_price.dart';
import 'package:sala_app/features/settings_view/presentation/views/widgets/custom_card_text_field.dart';

class PayMentViewBody extends StatefulWidget {
  const PayMentViewBody({super.key});

  @override
  State<PayMentViewBody> createState() => _PayMentViewBodyState();
}

class _PayMentViewBodyState extends State<PayMentViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool value = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return AppColors.kPrimaryColor;
      }
      return AppColors.kPrimaryColor;
    }

    var cartCubit = CartCubit.get(context);
    var height = SizeConfig.height(context);
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              BuildTotlaPrice(
                cartModel: cartCubit.cartModel!,
              ),
              SizedBox(
                height: height*0.040,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.payment,
                    color: AppColors.kPrimaryColor,
                    size: 30,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    children: [
                      const Text(
                        'Payments Mode',
                        style: TextStyle(fontSize: 27),
                      ),
                      Text(
                        'Select Your by payments mode',
                        style: Styles.textStyle15
                            .copyWith(color: AppColors.kSecondryTextColor),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: height*0.040,
              ),
              CustomCardTextField(),
              Text(
                'OR',
                style: Styles.textStyle14,
              ),
              SizedBox(
                height: height*0.022,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 70,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ThemeappCubit.get(context).isDark
                            ? Colors.grey[300]!
                            : Colors.black54,
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Image.network(
                        'https://png.pngtree.com/png-vector/20230311/ourmid/pngtree-free-delivery-simple-icon-vector-png-image_6637914.png',
                        height: 35,
                        width: 35,
                      ),
                      SizedBox(width: 15),
                      Text('pay on delivery',
                          style: Styles.textStyle18
                              .copyWith(color: AppColors.kPrimaryColor)),
                      Spacer(),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: value,
                        onChanged: (bool? newValue) {
                          setState(() {
                            value = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height*0.028,
              ),
              ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.width(context) * 0.13),
                itemBuilder: (context, index) => MainButton(
                  width: SizeConfig.width(context) * 0.55,
                  height: 55,
                  text: 'Save',
                  function: () {
                    CartCubit.get(context).changeCart(
                        productId: CartCubit.get(context)
                            .cartModel!
                            .data!
                            .cartItems![index]
                            .product!
                            .id!);
                  },
                  borderRadius: 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
