part of 'sign_up_cubit.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final LoginModel user;
  SignUpSuccess(this.user);
}

class SignUpError extends SignUpState {
  final String error;
  SignUpError(this.error);
}