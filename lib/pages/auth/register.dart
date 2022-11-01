// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool eye = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset(
              "assets/Copyright-pana.png",
              height: 200,
            ),
            Text(
              "create to your account",
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "firstName", prefixIcon: Icon(Icons.person)),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "lastName", prefixIcon: Icon(Icons.person)),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "email", prefixIcon: Icon(Icons.email)),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "password", prefixIcon: Icon(Icons.password)),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "comfirm password",
                  prefixIcon: Icon(Icons.password)),
            ),
          ],
        ),
      )),
    );
  }
}
