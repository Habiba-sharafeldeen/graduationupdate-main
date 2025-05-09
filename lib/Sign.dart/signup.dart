import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/Sign.dart/login.dart';
import 'package:graduation/Sign.dart/login_form.dart';
import 'package:graduation/Sign.dart/login_option.dart';
import 'package:graduation/Sign.dart/primary_button.dart';
import 'package:graduation/Sign.dart/signup_form.dart';
import 'package:graduation/api_service.dart';
import 'package:graduation/features/auth/presentation/pages/sign_in_page.dart';
import 'package:graduation/manger/sign_up_cubit.dart';
import 'package:graduation/repo/repoImpl.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(repo: LoginRepoImpl(ApiService(Dio()))),
      child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Sign up',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
            const SizedBox(height: 5,
            ),
            
            const SizedBox(height:10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SignUpForm(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  
                  const SizedBox(height: 5
                  ),
                  GestureDetector(
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const LogInScreen(),),);
                    },
                    child:const Text('Already have an account?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: PrimaryButton(buttonText: 'Sign Up'),
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Or sign up with social account'),
            ),
            const SizedBox(height:20,),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: LoginOption(),
            ),
            const SizedBox(height: 20,),
            
          ],
        ),
      ),
    ),
    );
   
  }
}