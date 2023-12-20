import 'package:flutter/material.dart';
import 'package:saharapp/pages/login.dart';
import 'package:saharapp/pages/signup.dart';
import 'package:saharapp/pages/welcome.dart';
import 'package:saharapp/pages/camerapage.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:'/',
      routes: {
        '/':(context) => const Welcome(),
        '/login':(context) => const Login(),
        '/Signup':(context) => const SignUp(),
        '/camerapage':(context) =>  Mycamera(),
      },
    );
  }
}
