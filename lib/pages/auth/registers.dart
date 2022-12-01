// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../controller/main_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final comfirm_password = TextEditingController();

  final MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
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
                  "Register to your account",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: firstname,
                  validator: ((value) {
                    if (value!.isEmpty || value == null) {
                      return "firstname is require";
                    }
                    return null;
                  }),
                  decoration: InputDecoration(
                    label: Text("firstname"),
                    prefixIcon: Icon(Icons.person),
                    hintText: "firstname",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: lastname,
                  validator: ((value) {
                    if (value!.isEmpty || value == null) {
                      return "lastname is require";
                    }
                    return null;
                  }),
                  decoration: InputDecoration(
                    label: Text("lastname"),
                    prefixIcon: Icon(Icons.person),
                    hintText: "lastname",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
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
                TextFormField(
                  controller: comfirm_password,
                  validator: ((value) {
                    if (value!.isEmpty || value == null) {
                      return "comfirm password is require";
                    }
                    return null;
                  }),
                  decoration: InputDecoration(
                    label: Text("Comfirm Password"),
                    prefixIcon: Icon(Icons.key),
                    hintText: "Comfirm Password",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    height: 60,
                    width: 160,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.amber.shade600)),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            controller.register(
                              firstname.text,
                              lastname.text,
                              email.text,
                              password.text,
                            );
                          }
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
