// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_app/pages/auth/login.dart';
import 'package:e_commerce_app/pages/home/home.dart';
import 'package:e_commerce_app/pages/splash/bottombar.dart';
import 'package:e_commerce_app/pages/splash/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bottombars(),
    );
  }
}
