// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_app/pages/auth/login.dart';
import 'package:e_commerce_app/pages/home/home.dart';
import 'package:e_commerce_app/pages/splash/bottombar.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

routes() => [
      GetPage(name: "/login", page: () => Login()),
      GetPage(name: "/home", page: () => Home()),
      GetPage(name: "/bottombar", page: () => Bottombars()),
    ];
