import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sala_app/constans/constans.dart';
import 'package:sala_app/core/functions/print_full_text.dart';
import 'package:sala_app/core/network/end_point/end_point.dart';
import 'package:sala_app/core/network/remote/dio_helper.dart';
import 'package:sala_app/features/categories_view/data/models/category_model/category.model.dart';
import 'package:sala_app/features/home_view/data/favorite_model/change_favorites/change_favorites_model.dart';
import 'package:sala_app/features/home_view/data/favorite_model/favorites/favorites.model.dart';
import 'package:sala_app/features/home_view/data/home_model/home.model.dart';

part 'home_data_state.dart';

class HomeDataCubit extends Cubit<HomeDataState> {
  HomeDataCubit() : super(HomeDataInitial());

  static HomeDataCubit get(context) => BlocProvider.of(context);
  HomeModel? homeModel;

  Map<int, bool> favoriteList = {};

  Future<void> getHomeData() async {
    emit(HomeDataLoading());
    try {
      Response response = await DioHelper.getData(endPoint: HOME, token: token);
      homeModel = HomeModel.fromJson(response.data);

      for (var element in homeModel!.data!.products!) {
        favoriteList.addAll({element.id!: element.inFavorites!});
      }
      print(favoriteList);

      emit(HomeDataSuccess(homeModel: homeModel!));
      printFullText("MYDAATAA${homeModel!.data!.banners![0].image.toString()}");
    } catch (e) {
      print(('ERRROOOR${e.toString()}'));
      emit(HomeDataFailure(errMessage: e.toString()));
    }
  }

  int indexCarouselSider = 0;
  void changeindexCarouselSider(int index) {
    indexCarouselSider = index;
    emit(ChangeIndexCarouselSliderState());
  }

//Get Gategories Data at Home

  CategoryModel? categoryModel;
  Future<void> getCategoryData() async {
    emit(CategoryDataLoading());
    try {
      Response response = await DioHelper.getData(
        endPoint: Get_CATEGORY,
      );
      categoryModel = CategoryModel.fromJson(response.data);
      emit(CategoryDataSuccess());
    } catch (e) {
      print(('MMMYYYERRROOOR${e.toString()}'));
      emit(CategoryDataFailure(errMessage: e.toString()));
    }
  }






//Get FavoriteScreen
FavoritesModel? favoritesModel;

  Future<void> getFavoritesData() async {
    emit(FavoritesLoadingState());
    try {
      Response response =
          await DioHelper.getData(endPoint: FAVORITES, token: token);
      favoritesModel = FavoritesModel.fromJson(response.data);
      print('FAV DATA ${response.data}');
      emit(FavoritesSuccessState());
    } catch (e) {
      print(e.toString());
      emit(FavoritesFailureState(e.toString()));
    }
  }

 //select Fav Product
  ChangeIconeFavoriteModel? changeIconeFavoriteModel;

  Future<void> changeIconFavorites({required int productId}) async {

    favoriteList[productId] = !favoriteList[productId]!;
    emit(ChangeFavoritesLoadingState());
    try {
      Response response = await DioHelper.postData(
          endPoint: FAVORITES, data: {'product_id': productId}, token: token);
      changeIconeFavoriteModel =
          ChangeIconeFavoriteModel.fromJson(response.data);
      print(response.data);

      if (!changeIconeFavoriteModel!.status) {
        favoriteList[productId] = !favoriteList[productId]!;
      }else{
        getFavoritesData();
      }
      emit(ChangeFavoritesSuccessState(changeIconeFavoriteModel!));
    } catch (e) {
      favoriteList[productId] = !favoriteList[productId]!;
      print(e.toString());
      emit(ChangeFavoritesFailureState(e.toString()));
    }
  }
}


