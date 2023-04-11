import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sala_app/features/cart_view/presentation/view_models/get_cart_cubit/cart_cubit.dart';
import 'package:sala_app/features/categories_view/presentation/views/categories_view.dart';
import 'package:sala_app/features/favorite_view/presentation/views/favorite_view.dart';
import 'package:sala_app/features/home_view/presentation/views/home_view.dart';
import 'package:sala_app/features/product_details_view/presentation/view_models/cubit/product_details_cubit.dart';
import 'package:sala_app/features/settings_view/presentation/views/settings_view.dart';

part 'bottom_nav_bar_cubit_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitialState());
  static BottomNavBarCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomViews = [
    HomeView(),
    CategoriesView(),
    FavoriteView(),
    SettingsView(),
  ];

  void changeBottomIndex(int index) {
    currentIndex = index;
    emit(BottomChangeIndexState());
  }

  CartCubit cartCubit = CartCubit(ProductDetailsCubit());
}
