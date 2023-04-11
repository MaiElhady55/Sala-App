import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sala_app/constans/constans.dart';
import 'package:sala_app/core/network/remote/dio_helper.dart';
import 'package:sala_app/features/product_details_view/data/models/product_details_model.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  ProductDetailsmodel? productDetailsmodel;

  Future<void> getProductDetails({required int id}) async {
    emit(ProductDetailsLoading());

    try {
      Response response =
          await DioHelper.getData(endPoint: "products/$id", token: token);
      productDetailsmodel = ProductDetailsmodel.fromJson(response.data);
      emit(ProductDetailsSuccess());
    } catch (e) {
      print(e.toString());
      emit(ProductDetailsFailure());
    }
  }
}
