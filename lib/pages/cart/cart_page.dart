// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/controller/main_controller.dart';
import 'package:e_commerce_app/model/cart_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/loading.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController controller = Get.put(CartController());
  final int total = 0;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isCartLoading.value) {
        return const Loading();
      } else {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple.shade500,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Get.back();
              },
            ),
            title: Text(
              "My Cart",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: GetBuilder<CartController>(builder: (context) {
            return ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: controller.listCartModel.length,
                itemBuilder: (context, index) {
                  CartModel data = controller.listCartModel[index];
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      elevation: 5,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: Image.network(
                              "${data.image}",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${data.name}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    height: 15,
                                    width: 130,
                                    child: Text(
                                      "${data.desc}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller.removeCart(data);
                                          },
                                          child: Container(
                                            height: 30,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.orange.shade200),
                                            child: Icon(
                                              Icons.remove,
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        GetBuilder<CartController>(
                                            builder: (context) {
                                          return Text(
                                              "${data.amount.toString()}");
                                        }),
                                        SizedBox(width: 20),
                                        // add
                                        InkWell(
                                          onTap: () {
                                            controller.addCart(
                                              id: data.id.toString(),
                                              amount: data.amount!,
                                            );
                                          },
                                          child: Container(
                                            height: 30,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.orange.shade200),
                                            child: Icon(
                                              Icons.add,
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(width: 20),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    controller.delete(data);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                              Text(
                                "${data.price} ₭",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
          bottomNavigationBar: Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: Row(
              children: [
                SizedBox(width: 10),
                Text(
                  "ລາຄາ",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(width: 10),
                Text(
                  "${controller.totalPrice.toString()}",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () => Get.toNamed('/payment'),
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Center(
                          child: Text(
                        "ຊຳລະເງີນ",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}
