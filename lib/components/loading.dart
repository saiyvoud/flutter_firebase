import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
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
