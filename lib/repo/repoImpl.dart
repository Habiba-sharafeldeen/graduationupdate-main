import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation/api_service.dart';
import 'package:graduation/core/utils/error/failure.dart';
import 'package:graduation/models/login_model.dart';
import 'package:graduation/repo/loginrepo.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiService apiService;

  LoginRepoImpl(this.apiService);

  @override
  Future<Either<Failure, LoginModel>> registerUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
  }) async {
    try {
      var data = await apiService.postData(
        endpoint: 'api/Account/Register',
        data: {
          'userName': name,
          'email': email,
          'password': password,
          'phone': phone,
          'address': address,
        },
      );
      return right(LoginModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginModel>> LoginUser({
    required email,
    required password,
  }) async {
    try {
      var data = await apiService.postData(
        endpoint: 'api/Account/Login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return right(LoginModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  // لو عندك resetPassword في LoginRepo Interface، ضيفها هنا
  Future<Either<Failure, String>> resetPassword({required String email}) async {
    try {
      var data = await apiService.postData(
        endpoint: 'api/Account/ResetPassword',
        data: {'email': email},
      );
      return right(data['message'] ?? 'Check your email');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}