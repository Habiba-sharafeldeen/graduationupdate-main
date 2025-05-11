import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/Sign.dart/primary_button.dart';
import 'package:graduation/Sign.dart/reset_form.dart';
import 'package:graduation/manger/reset_password_cubit.dart';
import 'package:graduation/api_service.dart';
import 'package:graduation/repo/repoImpl.dart';
import 'package:dio/dio.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(
        repo: LoginRepoImpl(ApiService(Dio())),
      ),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is ResetPasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<ResetPasswordCubit>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 150),
                  const Text('Forget Password', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  const Text('Please enter your email address.'),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: cubit.emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Color(0xFF979797)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF1B383A)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  PrimaryButton(
                    buttonText: state is ResetPasswordLoading ? 'Loading...' : 'Reset Password',
                    onPressed: state is ResetPasswordLoading
                        ? null
                        : () => cubit.resetPassword(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}