import 'package:dartz/dartz.dart';
import 'package:graduation/core/utils/error/failure.dart';
import 'package:graduation/models/login_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginModel>> LoginUser({
    required String email,
    required String password,
  });

  Future<Either<Failure, LoginModel>> registerUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
  });

  Future<Either<Failure, String>> resetPassword({
    required String email,
  });
}

