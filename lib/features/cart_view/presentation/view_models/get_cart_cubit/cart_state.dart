part of 'cart_cubit.dart';

@immutable
abstract class CartState {}
//Cart Screen

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {}

class CartFailureState extends CartState {
  final String errMessage;

  CartFailureState(this.errMessage);
}

//Plus and mins product in cart
class CartPlusQuantityState extends CartState {}

class CartMinusQuantityState extends CartState {}

//select Cart product
class ChangeCartLoadingState extends CartState {}

class ChangeCartSuccessState extends CartState {
  final ChangeCartsModel changeCartsModel;

  ChangeCartSuccessState({required this.changeCartsModel});
}

class ChangeCartFailureState extends CartState {
  final String errMessage;

  ChangeCartFailureState({required this.errMessage});
}

//calculte price
class CountCartLoading extends CartState {}

class CountCartSuccess extends CartState {}

class CountCartFailure extends CartState {
  final String errMessage;

  CountCartFailure({required this.errMessage});
}
