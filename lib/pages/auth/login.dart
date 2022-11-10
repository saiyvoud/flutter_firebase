// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_app/pages/auth/register.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
                "Login to your account",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("email"),
                  prefixIcon: Icon(Icons.email),
                  hintText: "email@gmail.com",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Password"),
                  prefixIcon: Icon(Icons.key),
                  hintText: "password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              Container(
                  height: 60,
                  width: 160,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                      child: Text("Login"))),
              SizedBox(height: 10),
              Container(
                  height: 60,
                  width: 160,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Register())));
                      },
                      child: Text("Register"))),
            ],
          ),
        ),
      ),
    );
  }
}
