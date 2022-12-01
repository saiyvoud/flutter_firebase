// ignore_for_file: prefer_final_fields

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/color.dart';

class BannerPage extends StatefulWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  State<BannerPage> createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  var _img = [
    "assets/images/1.jpeg",
    "assets/images/2.jpeg",
    "assets/images/3.jpeg",
    "assets/images/4.jpeg",
    "assets/images/5.jpeg",
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _banner(),
        SizedBox(height: 5),
        _indotor(),
      ],
    );
  }

  _banner() {
    return CarouselSlider(
      options: CarouselOptions(
          height: 120.0,
          autoPlay: true,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          }),
      items: _img
          .map(
            (i) => Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(color: Colors.amber),
              child: Image.asset(
                i,
                fit: BoxFit.cover,
              ),
            ),
          )
          .toList(),
    );
  }

  _indotor() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _img.map((url) {
        int index = _img.indexOf(url);
        return Container(
          width: 8,
          height: _current == index ? 8 : 5,
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            shape: _current == index ? BoxShape.circle : BoxShape.circle,
            color: primaryColor,
          ),
        );
      }).toList(),
    );
  }
}
