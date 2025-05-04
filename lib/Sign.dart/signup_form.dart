import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        buildInputForm('user name',false),
        buildInputForm('email',false),
        buildInputForm('Password',true),
        buildInputForm('phone',false),
        buildInputForm('adddress',false),
      ],
    );
  }

  Padding buildInputForm(String hint, bool pass) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          obscureText: pass ? _isObscure : false,
          decoration: InputDecoration(hintText: hint,
          hintStyle: const TextStyle(
            color:  Color(0xff979797),
            ),
             focusedBorder : const UnderlineInputBorder(
          borderSide :BorderSide(color: Color(0xFF1B383A)),
          ),
          suffixIcon:pass ?
           IconButton(
            onPressed: (){
              setState(() {
                _isObscure = !_isObscure;
              });
            },
           icon: _isObscure? const Icon(
            Icons.visibility_off,color: Color(0xFF1B383A),
            )
            :const Icon(Icons.visibility,color: Color(0xFF1B383A))
          ): null,
          ),
        ),
        );
  }
 
}