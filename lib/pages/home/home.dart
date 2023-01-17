// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/components/banner.dart';
import 'package:e_commerce_app/controller/cart_controller.dart';

import 'package:e_commerce_app/controller/main_controller.dart';
import 'package:e_commerce_app/pages/home/detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/data.dart';
import '../../components/loading.dart';
import '../../constants/color.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final MainController controller = Get.put(MainController());
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Loading();
      } else {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: primaryColor,
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
              GetBuilder<CartController>(builder: (cartController) {
                if (cartController.isCartLoading.value) {
                  return CircularProgressIndicator();
                } else {
                  return Stack(
                    children: [
                      Center(
                        child: InkWell(
                          onTap: () {
                            Get.toNamed("/cart");
                          },
                          child: Icon(Icons.shopping_cart),
                        ),
                      ),
                      Positioned(
                        top: 3,
                        left: 0,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                                  "${cartController.listCartModel.length}")),
                        ),
                      ),
                    ],
                  );
                }
              }),
              IconButton(
                onPressed: () async {
                  await controller.logout();
                  Get.offAllNamed("/login");
                },
                color: Colors.white,
                icon: Icon(Icons.exit_to_app),
              ),
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
                // color: primaryColor,
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: icon.length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          Image.asset(
                            "${icon[index]["icon"]}",
                            fit: BoxFit.cover,
                            height: 50,
                          ),
                          Text("${icon[index]['title']}")
                        ],
                      );
                    })),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("Flash Sale",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        padding:
                                            const EdgeInsets.only(left: 100),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        padding:
                                            const EdgeInsets.only(left: 100),
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
                  )),
              //======>
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "For you",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  height: 500,
                  color: Colors.red,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: controller.productList.length,
                    itemBuilder: ((context, index) {
                      var data = controller.productList[index];
                      return InkWell(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Detail(
                                        productModel: data,
                                      )));
                        }),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.network(
                                    "${data.image}",
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  '${data.name}',
                                  overflow: TextOverflow.clip,
                                ),
                                Container(
                                  height: 18,
                                  child: Text(
                                    '${data.desc}',
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                                Text(
                                  '${data.price}',
                                  overflow: TextOverflow.clip,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  )),
            ],
          )),
        );
      }
    });
  }
}
