// import 'package:e_commerce_app/constants/color.dart';
// import 'package:flutter/material.dart';

// import '../home/home.dart';

// class Bottombars extends StatefulWidget {
//   const Bottombars({Key? key}) : super(key: key);

//   @override
//   State<Bottombars> createState() => _BottombarsState();
// }

// class _BottombarsState extends State<Bottombars> {
//   int currentIndex = 0;
//   void _onItemTapped(int index) {
//     setState(() {
//       currentIndex = index;
//     });
//   }

// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, prefer_const_literals_to_create_immutables

//   final List<Widget> _children = [
//     Home(),
//     Container(height: 200, color: Colors.green),
//     Home(),
//     Container(height: 200, color: Colors.orange),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _children[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//           backgroundColor: Colors.white,
//           type: BottomNavigationBarType.fixed,
//           selectedItemColor: primaryColor,
//           currentIndex: currentIndex,
//           onTap: _onItemTapped,
//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
//             BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.notifications_active_outlined),
//                 label: "notification"),
//             BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
//           ]),
//     );
//   }
// }stf
import 'package:e_commerce_app/pages/home/home.dart';
import 'package:flutter/material.dart';

class Bottombars extends StatefulWidget {
  const Bottombars({Key? key}) : super(key: key);

  @override
  State<Bottombars> createState() => _BottombarsState();
}

class _BottombarsState extends State<Bottombars> {
  int _currenwidget = 0;
  List<Widget> _children = [
    Home(), // 0
    Container(
      height: 500,
      color: Colors.blue,
    ), // 1
    Home(), //2
    Container(
      height: 500,
      color: Colors.purple,
    ), //3
  ];
  void _onTap(int index) {
    setState(() {
      _currenwidget = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currenwidget],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.purple.shade500,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currenwidget,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notification_add), label: "notification"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
      ),
    );
  }
}
