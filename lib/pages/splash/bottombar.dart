import 'package:flutter/material.dart';

import '../home/home.dart';

class Bottombars extends StatefulWidget {
  const Bottombars({Key? key}) : super(key: key);

  @override
  State<Bottombars> createState() => _BottombarsState();
}

class _BottombarsState extends State<Bottombars> {
  int currentIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> _children = [
    Home(),
    Container(height: 200, color: Colors.green),
    Home(),
    Container(height: 200, color: Colors.orange),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          currentIndex: currentIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_active_outlined),
                label: "notification"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
          ]),
    );
  }
}
