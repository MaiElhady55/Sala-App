import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sala_app/constans/constans.dart';
import 'package:sala_app/core/functions/print_full_text.dart';
import 'package:sala_app/core/network/end_point/end_point.dart';
import 'package:sala_app/core/network/remote/dio_helper.dart';
import 'package:sala_app/features/cart_view/data/models/cart/cart.model.dart';
import 'package:sala_app/features/cart_view/data/models/change_cart/change_cart_model.dart';
import 'package:sala_app/features/product_details_view/presentation/view_models/cubit/product_details_cubit.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.productDetailsCubit) : super(CartInitialState());

  static CartCubit get(context) => BlocProvider.of(context);

  CartModel? cartModel;

  Future<void> getCartData() async {
    emit(CartLoadingState());
    try {
      Response response = await DioHelper.getData(endPoint: CART, token: token);
      cartModel = CartModel.fromJson(response.data);
      printFullText('MY RESPONSE ${response.data.toString()}');
      print('get cart token ${token}');

      emit(CartSuccessState());
    } catch (e) {
      print('ERRORR${e.toString()}');
      emit(CartFailureState(e.toString()));
    }
  }

  //Plus and mins product in cart
  int quantity = 1;

  void plusQuantity(CartModel cartModel, int index) {
    quantity = cartModel.data!.cartItems![index].quantity!;
    quantity++;
    emit(CartPlusQuantityState());
  }

  void minusQuantity(CartModel cartModel, int index) {
    quantity = cartModel.data!.cartItems![index].quantity!;
    if (quantity > 1) quantity--;
    emit(CartMinusQuantityState());
  }

  Map<int, bool> cartList = {};
  ChangeCartsModel? changeCartsModel;
  ProductDetailsCubit productDetailsCubit;

  Future<void> changeCart({required int productId}) async {
    emit(ChangeCartLoadingState());

    try {
      Response response = await DioHelper.postData(
          endPoint: CART,
          data: {
            'product_id': productId,
          },
          token: token);
      changeCartsModel = ChangeCartsModel.fromJson(response.data);
      printFullText(response.data.toString());
      print(' THE MESSAGE ${changeCartsModel!.message}');
      getCartData();
      productDetailsCubit.getProductDetails(id: productId);
      emit(ChangeCartSuccessState(changeCartsModel: changeCartsModel!));
    } catch (e) {
      cartList[productId] = !cartList[productId]!;
      print(e.toString());
      emit(ChangeCartFailureState(errMessage: e.toString()));
    }
  }

  //Calculate Price
  Future<void> updateCardData(
      {required String id, required, required int quantity}) async {
    emit(CountCartLoading());
    try {
      await DioHelper.puttData(
          endPoint: UPDATECARTS + id,
          data: {'quantity': quantity},
          token: token);
      emit(CountCartSuccess());
      getCartData();
    } catch (e) {
      printFullText('ERROR UPDATE CARTS DATA${e.toString()}');
      emit(CountCartFailure(errMessage: e.toString()));
    }
  }
}
