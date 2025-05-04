import 'package:flutter/material.dart';
import 'package:graduation/Sign.dart/login.dart';
import 'package:graduation/core/utils/colors.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.primaryColor),
        useMaterial3: true,
      ),
      home:  const LogInScreen(),
    );
  }
}

// class StorePorfollio extends StatelessWidget {
//   const StorePorfollio({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
