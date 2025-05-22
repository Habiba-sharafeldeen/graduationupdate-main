
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/Sign.dart/login_option.dart';
import 'package:graduation/Sign.dart/primary_button.dart';
import 'package:graduation/Sign.dart/reset_password.dart';
import 'package:graduation/Sign.dart/signup.dart';
import 'package:graduation/api_service.dart';
import 'package:graduation/features/home/presentation/pages/home_page.dart';
import 'package:graduation/manger/login_cubit.dart';
import 'package:graduation/repo/repoImpl.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginCubit(loginRepo: LoginRepoImpl(ApiService(Dio()))),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const LoginForm(),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResetPasswordScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Color(0xFF5B5B5B),
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Or log In with social account:',
                  style: TextStyle(color: Color(0xFF272726)),
                ),
                const SizedBox(height: 20),
                const LoginOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSucess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login Success')));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LogInScreen()),
          );
        } else if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextFormField(
                controller: cubit.emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Color(0xff979797)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1B383A)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextFormField(
                controller: cubit.passwordController,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Color(0xff979797)),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1B383A)),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                      color: const Color(0xFF1B383A),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            state is LoginLoading
                ? const CircularProgressIndicator()
                : GestureDetector(
                    onTap: () {
                      cubit.LoginUser();
                    },
                    child: const PrimaryButton(buttonText: 'Log In'),
                  ),
          ],
        );
      },
    );
  }
}