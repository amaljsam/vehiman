import 'package:flutter/material.dart';
import 'pages/signup.dart';
import 'pages/resetpass.dart';
import 'pages/login.dart';
import 'pages/home.dart';
import 'pages/admin.dart';
import 'pages/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
    '/': (context) => Login(),
    '/signup': (context) => Signup(),
    '/reset': (context) => ResetPasswordScreen(),
    '/home': (context) => HomePage(),
    '/admin': (context) => Admin(),
    '/profile': (context) => UserProfilePage(),
    },
        );
    }
}