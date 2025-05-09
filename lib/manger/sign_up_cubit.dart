import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/models/login_model.dart';
import 'package:graduation/repo/repoImpl.dart';
import 'package:graduation/core/utils/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.repo}) : super(SignUpInitial());

  final LoginRepoImpl repo;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  void signUpUser() async {
    emit(SignUpLoading());
    Either<Failure, LoginModel> result = await repo.registerUser(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      phone: phoneController.text,
      address: addressController.text,
    );
    result.fold(
      (failure) => emit(SignUpError(failure.errMessage)),
      (model) => emit(SignUpSuccess(model)),
    );
  }
}