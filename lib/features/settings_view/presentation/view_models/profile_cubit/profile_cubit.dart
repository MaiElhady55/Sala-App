import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sala_app/constans/constans.dart';
import 'package:sala_app/core/network/end_point/end_point.dart';
import 'package:sala_app/core/network/remote/dio_helper.dart';
import 'package:sala_app/features/auth_view/data/auth_model/auth.model.dart';
import 'package:sala_app/features/settings_view/data/models/profile/profile.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  Profile? profileModel;

  Future<void> getProfileData() async {
    emit(ProfileLoading());
    try {
      Response response =
          await DioHelper.getData(endPoint: PROFILE, token: token);
      profileModel = Profile.fromJson(response.data);
      emit(ProfileSuccess());
    } catch (e) {
      print(e.toString());
      emit(ProfileFailure(e.toString()));
    }
  }

  //Update Profile
  AuthModel? authModel;
  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone,
  }) async {
    emit(UpdateProfileLoadingStates());
    try {
      Response response = await DioHelper.puttData(
          endPoint: UPDATE_PROFILE,
          data: {'name': name, 'email': email, 'phone': phone},
          token: token);
      authModel = AuthModel.fromJson(response.data);
      getProfileData();
      emit(UpdateProfileSuccessState(authModel!));
    } catch (e) {
      print(e.toString());
      emit(UpdateProfileFailureStates(e.toString()));
    }
  }
}
