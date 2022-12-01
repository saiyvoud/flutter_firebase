// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_app/pages/auth/registers.dart';
import 'package:e_commerce_app/pages/splash/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/main_controller.dart';
import '../home/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
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
                  controller: email,
                  validator: ((value) {
                    if (value!.isEmpty || value == null) {
                      return "email@gmail.com is require";
                    }
                    return null;
                  }),
                  decoration: InputDecoration(
                    label: Text("email"),
                    prefixIcon: Icon(Icons.email),
                    hintText: "email@gmail.com",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: password,
                  validator: ((value) {
                    if (value!.isEmpty || value == null) {
                      return "password is require";
                    }
                    return null;
                  }),
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
                          if (formkey.currentState!.validate()) {
                            controller.login(email.text, password.text);
                          }
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
                                  builder: ((context) => RegisterPage())));
                        },
                        child: Text("Register"))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
