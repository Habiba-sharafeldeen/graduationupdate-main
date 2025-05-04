import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation/api_service.dart';
import 'package:graduation/core/utils/error/failure.dart';
import 'package:graduation/models/login_model.dart';
import 'package:graduation/repo/loginrepo.dart';

class LoginRepoImpl implements LoginRepo{
  final ApiService apiService;

  LoginRepoImpl(this.apiService);
  @override
  Future<Either<Failure, LoginModel>> LoginUser({required email, required password})async{
    try{
      var data= await apiService.post(endpoint: 'api/Account/Login', data: {
      'email': email,
      'password': password
    });
    return right(LoginModel.fromJson(data));
    }catch(e){
      if(e is DioException){
        return left(
          ServerFailure.fromDioError(e)
        );
      }
      return left(ServerFailure(e.toString()));
    }
    
  }

}