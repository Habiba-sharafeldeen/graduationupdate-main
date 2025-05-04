import 'package:flutter/material.dart';
import 'package:graduation/Sign.dart/login.dart';
import 'package:graduation/Sign.dart/primary_button.dart';
import 'package:graduation/Sign.dart/reset_form.dart';
import 'package:graduation/features/auth/presentation/pages/sign_in_page.dart';


class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height:150,),
            const Text('forget password'),
            const SizedBox(height: 5,),
            const Text('please,enter your email address or user name'),
            const SizedBox(height: 10,),
            const ResetForm(),
            const SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const LogInScreen()));
              },
              child: 
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: PrimaryButton(buttonText: 'Reset Password'),
              ))
          ],
        ),
      ),
    );
  }
}