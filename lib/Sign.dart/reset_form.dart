import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/manger/reset_password_cubit.dart';

class ResetForm extends StatelessWidget {
  const ResetForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResetPasswordCubit>();

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: cubit.emailController,
        decoration: const InputDecoration(
          hintText: 'Email',
          hintStyle: TextStyle(color: Color(0xFF979797)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF1B383A)),
          ),
        ),
      ),
    );
  }
}