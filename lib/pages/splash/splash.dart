import 'dart:async';

import 'package:e_commerce_app/pages/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    });
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Center(
            child: Container(
                height: 200,
                width: 200,
                margin: EdgeInsets.symmetric(vertical: 200),
                child: Lottie.asset('assets/animation/logo.json')),
          ),
          Text("Please loading..."),
        ],
      )),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final auth = FirebaseAuth.instance.currentUser;
  final firebase = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    check();
  }

  void check() async {
    await firebase.signOut();
  }

  @override
  Widget build(BuildContext context) {
    // Timer(Duration(seconds: 3), () {
    //   check();
    // });
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [Lottie.asset("assets/animation/flutter.json")],
      )),
    );
  }
}
