import 'package:flutter/material.dart';
import 'package:shopcraft_v2/auth/login.dart';
import 'package:shopcraft_v2/auth/sign.dart';
import 'package:shopcraft_v2/auth/welcome.dart';
import 'package:shopcraft_v2/shophome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'DM'),
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        'welcome': (context) => WelcomePage(),
        'login': (context) => const LoginPage(),
        'signup': (context) => const SignUpPage(),
        'shophome': (context) => const ShopHomePage(),
      },
    );
  }
}
