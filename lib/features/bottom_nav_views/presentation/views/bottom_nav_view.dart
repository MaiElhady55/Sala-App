import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala_app/core/functions/navigation.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/core/utils/size_config.dart';
import 'package:sala_app/features/bottom_nav_views/presentation/view_models/bottom_nav_bar_cubit/bottom_nav_bar_cubit_cubit.dart';
import 'package:sala_app/features/bottom_nav_views/presentation/views/widgets/custom_row_appbar.dart';
import 'package:sala_app/features/cart_view/presentation/views/cart_view.dart';
import 'package:sala_app/features/search_view/presentation/views/search_view.dart';

class BottomNavView extends StatelessWidget {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavBarCubit, BottomNavBarState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BottomNavBarCubit.get(context);
       // var cartCubit = cubit.cartCubit.cartModel?.data;
        //var item = cartCubit!.cartItems?.length.toString();
        return Scaffold(
            appBar: cubit.currentIndex != 4
                ? AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: CustomRowAppBar(),
                    actions: [
                      IconButton(
                          onPressed: () {
                            navigateTo(context: context, router: SearchView());
                          },
                          icon: Icon(
                            Icons.search,
                            color: AppColors.kPrimaryColor,
                            size: 30,
                          )),
                    ],
                  )
                : null,
            body: cubit.bottomViews[cubit.currentIndex],
            floatingActionButton:true// cartCubit.cartItems!.isEmpty
                ? FloatingActionButton(
                    onPressed: () {
                      navigateTo(context: context, router: CartView());
                    },
                    backgroundColor: AppColors.kPrimaryColor,
                    child: const Icon(Icons.shopping_cart),
                  )
                : Badge(
                    badgeContent: Text('${3}',//item!,
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                    child: FloatingActionButton(
                      onPressed: () {
                        navigateTo(context: context, router: CartView());
                      },
                      backgroundColor: AppColors.kPrimaryColor,
                      child: Icon(Icons.shopping_cart),
                    ),
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24)), //32
              child: BottomAppBar(
                color: Colors.white,
                shape: CircularNotchedRectangle(),
                notchMargin: 12,
                child: Container(
                  height: SizeConfig.height(context) * 0.1,
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.height(context) * 0.02),
                  decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            cubit.changeBottomIndex(0);
                          },
                          icon: Icon(
                            Icons.home_outlined,
                            size: 30,
                            color: cubit.currentIndex == 0
                                ? AppColors.kPrimaryColor
                                : Colors.grey,
                          )),
                      IconButton(
                          onPressed: () {
                            cubit.changeBottomIndex(1);
                          },
                          icon: Icon(
                            Icons.category_outlined,
                            size: 30,
                            color: cubit.currentIndex == 1
                                ? AppColors.kPrimaryColor
                                : Colors.grey,
                          )),
                      SizedBox(
                        width: SizeConfig.width(context) * 0.09,
                      ),
                      IconButton(
                          onPressed: () {
                            cubit.changeBottomIndex(2);
                          },
                          icon: Icon(
                            Icons.favorite_border_outlined,
                            color: cubit.currentIndex == 2
                                ? AppColors.kPrimaryColor
                                : Colors.grey,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: () {
                            cubit.changeBottomIndex(3);
                          },
                          icon: Icon(
                            Icons.settings_outlined,
                            size: 30,
                            color: cubit.currentIndex == 3
                                ? AppColors.kPrimaryColor
                                : Colors.grey,
                          )),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
