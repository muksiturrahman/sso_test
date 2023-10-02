import 'package:flutter/material.dart';
import 'package:sso_test/SigninPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0X222222)),
        useMaterial3: true,
      ),
      home: SignInPage(),
    );
  }
}