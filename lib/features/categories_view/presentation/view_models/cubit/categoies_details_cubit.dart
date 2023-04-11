import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sala_app/constans/constans.dart';
import 'package:sala_app/core/network/end_point/end_point.dart';
import 'package:sala_app/core/network/remote/dio_helper.dart';
import 'package:sala_app/features/categories_view/data/models/categories_details_model/categories.details.model.dart';

part 'categoies_details_state.dart';

class CategoiesDetailsCubit extends Cubit<CategoiesDetailsState> {
  CategoiesDetailsCubit() : super(CategoiesDetailsInitial());
  static CategoiesDetailsCubit get(context) => BlocProvider.of(context);

  CategoriesDetailsModel? categoriesDetailsModel;

  Future<void> getCategoriesDetails({required int categoryId}) async {
    emit(CategoiesDetailsLoading());
    try {
      Response response = await DioHelper.getData(
          endPoint: Get_CATEGORY_Details + categoryId.toString(), token: token);
      categoriesDetailsModel = CategoriesDetailsModel.fromJson(response.data);
      print(
          'SUCCESS Categroy DETAILS ${categoriesDetailsModel!.data!.productData!.toString()}');
      emit(CategoiesDetailsSuccess());
    } catch (e) {
      print('ERROR PRODUCT DETAILS${e.toString()}');
      emit(CategoiesDetailsFailure(e.toString()));
    }
  }
}
