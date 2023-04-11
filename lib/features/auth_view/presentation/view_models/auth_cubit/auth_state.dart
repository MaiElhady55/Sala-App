part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitialState extends AuthState {}

class ChangePasswordVisibilityState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final RegisterModel registerModel;
  RegisterSuccessState(this.registerModel);
}

class RegisterFailureState extends AuthState {
  final String errMessage;

  RegisterFailureState({required this.errMessage});
}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  AuthModel authModel;
  LoginSuccessState(this.authModel);
}

class LoginFailureState extends AuthState {
  final String errMessage;

  LoginFailureState({required this.errMessage});
}
