import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sala_app/constans/constans.dart';
import 'package:sala_app/core/network/end_point/end_point.dart';
import 'package:sala_app/core/network/remote/dio_helper.dart';
import 'package:sala_app/features/search_view/data/search/search.model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel;

  Future<void> getSearh({required String searchText}) async {
    emit(SearchLoading());
    try {
      Response response = await DioHelper.postData(
          endPoint: SEARCH, data: {'text': searchText}, token: token);
      searchModel = SearchModel.fromJson(response.data);
      print('MY DATAA ${searchModel!.data!.productData![0].id}');
      emit(SearchSuccess());
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }

}
