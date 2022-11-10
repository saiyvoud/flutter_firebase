// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/components/banner.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _icon = [
    {
      "icon": "assets/icons/fan.png",
      "title": "fan",
    },
    {
      "icon": "assets/icons/joystick.png",
      "title": "game",
    },
    {
      "icon": "assets/icons/menu.png",
      "title": "menu",
    },
    {
      "icon": "assets/icons/music-player.png",
      "title": "play",
    },
    {
      "icon": "assets/icons/pocket-camera.png",
      "title": "camera",
    },
    {
      "icon": "assets/icons/smartphone.png",
      "title": "phone",
    },
    {
      "icon": "assets/icons/ux.png",
      "title": "computer",
    },
    {
      "icon": "assets/icons/vr-glasses.png",
      "title": "vr & ar",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search product ...",
                prefixIcon: Icon(Icons.search, color: Colors.black)),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            color: Colors.white,
            icon: Icon(Icons.card_travel),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          BannerPage(),
          SizedBox(height: 20),
          Container(
            height: 200,
            // color: Colors.red,
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: _icon.length,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Image.asset("${_icon[index]["icon"]}"),
                      Text("${_icon[index]['title']}")
                    ],
                  );
                })),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("Flash Sale",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10),
          Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.orange[50],
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 5),
                            Text(
                              "Play Station 4",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.orange[500],
                                  fontWeight: FontWeight.bold),
                            ),
                            Image.asset(
                              "assets/images/ps4.jpg",
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    "NoteBook",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blue[500],
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 100),
                                    child: Image.asset(
                                      "assets/images/noteboo.jpeg",
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 90,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    "VR & AR",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.green[500],
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 100),
                                    child: Image.asset(
                                      "assets/images/PSVR-2020.jpeg",
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      )),
    );
  }
}
