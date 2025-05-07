import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/core/utils/error/failure.dart';
import 'package:graduation/repo/loginrepo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginRepo loginRepo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  LoginCubit({required this.loginRepo}): super (LoginInitial());
Future<void>LoginUser()async{
  SharedPreferences pref= await SharedPreferences.getInstance();
  isLoading=true;
  emit(LoginLoading());
  var result = await loginRepo.LoginUser(email: emailController, password: passwordController);
  result.fold((failure){
    isLoading=false;
    emit(LoginError(error: failure.errMessage));
  },
  (token){
    isLoading=false;
    pref.setString('token',token.data!.toString()??"");
    emit(LoginSucess());
  });
}
}