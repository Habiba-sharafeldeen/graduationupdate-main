import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/api_service.dart';
import 'package:graduation/manger/login_cubit.dart';
import 'package:graduation/repo/repoImpl.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}


class _LoginFormState extends State<LoginForm> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    var C=context.read<LoginCubit>();
    return Column(
      children: [
        buildInPutForm('Email',false),
        buildInPutForm('Password',true),
      ],
    );
  }

Padding buildInPutForm(String label, bool pass){
    return Padding(
      padding:const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        obscureText: pass ? _isObscure: false,
        decoration: InputDecoration(
          labelText: label,
          labelStyle:const TextStyle(
          color: Color(0xff979797)
        ),
        focusedBorder:const UnderlineInputBorder(
          borderSide :BorderSide(color: Color(0xFF1B383A)),
          ),
          suffixIcon: pass ?
            IconButton(
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
          icon:Icon(
            _isObscure ?Icons.visibility_off:Icons.visibility ,
          color: const Color(0xFF1B383A),
          ),
          )
          :null),
        
      ),
      
      );
   }
}