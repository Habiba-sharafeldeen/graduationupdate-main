import 'package:flutter/material.dart';

class LoginOption extends StatelessWidget {
  const LoginOption({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BuildButton(
          iconImage:Image(
            height: 20,
            width: 20,
            image: AssetImage('assets/images/facebook.png')
        ),
        TextButton: 'Facebook',
        ),
        BuildButton(
          iconImage:Image(
            height: 20,
            width: 20,
            image: AssetImage('assets/images/facebook.png')
        ),
        TextButton: 'Google',
        )
      ],
    );
  }
}

class BuildButton extends StatelessWidget {
  
  final Image iconImage;
  final String TextButton;
  const BuildButton({super.key, required this.iconImage, required this.TextButton});
  @override
  Widget build(BuildContext context) {
    return Container(
      height:  0.06,
      width:  0.36, 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border:Border.all(color:Colors.grey)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          iconImage,
          const SizedBox(width: 5,),
          Text(TextButton)
        ],),
    );
  }
}