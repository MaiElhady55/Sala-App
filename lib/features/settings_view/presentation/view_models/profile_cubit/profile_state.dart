part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {}

class ProfileFailure extends ProfileState {
  final String errMessage;

  ProfileFailure(this.errMessage);
}

class UpdateProfileLoadingStates extends ProfileState {}

class UpdateProfileSuccessState extends ProfileState {
  final AuthModel authModel;

  UpdateProfileSuccessState(this.authModel);
}

class UpdateProfileFailureStates extends ProfileState {
  final String errMessage;
  UpdateProfileFailureStates(this.errMessage);
}
