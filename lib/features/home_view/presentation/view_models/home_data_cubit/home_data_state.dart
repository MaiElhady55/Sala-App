part of 'home_data_cubit.dart';

@immutable
abstract class HomeDataState {}

class HomeDataInitial extends HomeDataState {}

class HomeDataLoading extends HomeDataState {}

class HomeDataFailure extends HomeDataState {
  final String errMessage;

  HomeDataFailure({required this.errMessage});
}

class HomeDataSuccess extends HomeDataState {
  final HomeModel homeModel;

  HomeDataSuccess({required this.homeModel});
}

class ChangeIndexCarouselSliderState extends HomeDataState {}

class CategoryDataLoading extends HomeDataState {}

class CategoryDataSuccess extends HomeDataState {}

class CategoryDataFailure extends HomeDataState {
  final String errMessage;

  CategoryDataFailure({required this.errMessage});
}



//Get Favorites Screen
class FavoritesLoadingState extends HomeDataState {}

class FavoritesFailureState extends HomeDataState {
  final String errMessage;

  FavoritesFailureState(this.errMessage);
}

class FavoritesSuccessState extends HomeDataState {}



//Select Favorite Product
class ChangeFavoritesLoadingState extends HomeDataState {}

class ChangeFavoritesSuccessState extends HomeDataState {
  final ChangeIconeFavoriteModel changeIconeFavoriteModel;

  ChangeFavoritesSuccessState(this.changeIconeFavoriteModel);
}

class ChangeFavoritesFailureState extends HomeDataState {
  final String errMessage;

  ChangeFavoritesFailureState(this.errMessage);
}
