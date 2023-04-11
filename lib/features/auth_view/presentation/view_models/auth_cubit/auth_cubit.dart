
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala_app/core/functions/print_full_text.dart';
import 'package:sala_app/core/network/end_point/end_point.dart';
import 'package:sala_app/core/network/remote/dio_helper.dart';
import 'package:sala_app/features/auth_view/data/auth_model/auth.model.dart';
import 'package:sala_app/features/auth_view/data/register/register.model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);

  AuthModel? authModel;

  Future<void> userLogin(
      {required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      Response data = await DioHelper.postData(
          endPoint: LOGIN, data: {'email': email, 'password': password});
      authModel = AuthModel.fromJson(data.data);
      emit(LoginSuccessState(authModel!));
    } catch (e) {
      print(e.toString());
      emit(LoginFailureState(errMessage: e.toString()));
    }
  }

  RegisterModel? registerModel;
  Future<void> userSignup(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    emit(RegisterLoadingState());
    try {
      Response data = await DioHelper.postData(endPoint: REGISTER, data: {
        'email': email,
        'password': password,
        'name': name,
        'phone': phone
      });
      registerModel = RegisterModel.fromJson(data.data);
      printFullText(registerModel!.data.toString());
      emit(RegisterSuccessState(registerModel!));
    } catch (e) {
      print('REG ERROR${e.toString()}');
      emit(RegisterFailureState(errMessage: e.toString()));
    }
  }

  IconData suffix = Icons.visibility;
  bool secirty = true;
  void ChangePasswordVisibility() {
    secirty = !secirty;
    suffix = secirty ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordVisibilityState());
  }
}
