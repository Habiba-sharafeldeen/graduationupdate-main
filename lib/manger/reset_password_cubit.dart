import 'package:bloc/bloc.dart';
import 'package:graduation/repo/repoImpl.dart';
import 'package:graduation/core/utils/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({required this.repo}) : super(ResetPasswordInitial());

  final LoginRepoImpl repo;

  final emailController = TextEditingController();

  void resetPassword() async {
    emit(ResetPasswordLoading());

    Either<Failure, String> result = await repo.resetPassword(
      email: emailController.text,
    );

    result.fold(
      (failure) => emit(ResetPasswordError(failure.errMessage)),
      (message) => emit(ResetPasswordSuccess(message)),
    );
  }
}