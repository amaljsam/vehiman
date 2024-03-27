import 'package:flutter/material.dart';
import 'pages/signup.dart';
import 'pages/resetpass.dart';
import 'pages/role.dart';
import 'pages/login.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/signup': (context) => Signup(),
        '/role': (context) => Role(),
        '/reset': (context) => ResetPasswordScreen(),

      },
    );
  }
}