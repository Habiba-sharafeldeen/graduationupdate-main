import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/manger/sign_up_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    return Column(
      children: [
        buildInputForm('user name', false, cubit.nameController),
        buildInputForm('email', false, cubit.emailController),
        buildInputForm('Password', true, cubit.passwordController),
        buildInputForm('phone', false, cubit.phoneController),
        buildInputForm('address', false, cubit.addressController),
      ],
    );
  }

  Padding buildInputForm(String hint, bool pass, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        obscureText: pass ? _isObscure : false,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xff979797)),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF1B383A)),
          ),
          suffixIcon: pass
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xFF1B383A),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}