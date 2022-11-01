// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Logins extends StatefulWidget {
  const Logins({Key? key}) : super(key: key);

  @override
  State<Logins> createState() => _LoginsState();
}

class _LoginsState extends State<Logins> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
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
                prefixIcon: Icon(Icons.email),
                hintText: "email@gmail.com",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.key),
                hintText: "*****",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Container(
                height: 60,
                width: 200,
                child: ElevatedButton(onPressed: () {}, child: Text("Login"))),
            SizedBox(height: 10),
            Container(
                height: 60,
                width: 200,
                child:
                    ElevatedButton(onPressed: () {}, child: Text("Register"))),
          ],
        )),
      ),
    );
  }
}
