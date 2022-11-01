// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_app/pages/auth/login.dart';
import 'package:flutter/material.dart';

import 'pages/logins.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
