import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  const PrimaryButton({super.key, required this.buttonText});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color:const Color(0xFF1B383A),
      ),
      child: Text(buttonText,
      style: const TextStyle(color: Color(0xFFFFFFFF)),
      ),
    );
  }
}
