// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_app/pages/auth/login.dart';
import 'package:e_commerce_app/pages/home/home.dart';
import 'package:e_commerce_app/pages/splash/bottombar.dart';
import 'package:e_commerce_app/pages/splash/splash.dart';
import 'package:e_commerce_app/utils/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/cart_controller.dart';
import 'controller/main_controller.dart';

void main() async {
  Get.lazyPut<MainController>(() => MainController());
  Get.lazyPut<CartController>(() => CartController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      getPages: routes(),
    );
  }
}
