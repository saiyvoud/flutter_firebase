// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';

class Detail extends StatefulWidget {
  final ProductModel productModel;
  const Detail({Key? key, required this.productModel}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final controller = Get.put(CartController());
  final userID = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
          height: 80,
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                controller.addProductToCart(
                    widget.productModel.id,
                    userID!.uid,
                    widget.productModel.name,
                    widget.productModel.desc,
                    widget.productModel.price,
                    widget.productModel.image);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                GetBuilder<CartController>(builder: (cartController) {
                  if (cartController.isCartLoading.value) {
                    return CircularProgressIndicator();
                  } else {
                    return Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Get.toNamed("/cart");
                            },
                          ),
                          Positioned(
                            top: 2,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.red),
                              child: Center(
                                  child: Text(
                                "${controller.listCartModel.length}",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
          Image.network("${widget.productModel.image}",
              height: 200, fit: BoxFit.cover),
          SizedBox(height: 20),
          Container(
            height: size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.list_alt),
                      Text(
                        "ລາຍລະອຽດສິນຄ້າ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Text(
                    "${widget.productModel.name}",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${widget.productModel.desc}",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${widget.productModel.price} ₭",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.motorcycle),
                      Text(
                        "ລາຍລະອຽດການຈັດສົ່ງ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Text(
                    "ມາລຸ້ນເປັນຜູ້ໂຊກດີທີ່ໄດ້ຮັບຂອງລາງວັນສຸດພິເສດ ສະຫຼອງ ຄົບຮອບ 3 ປີ ຟູດແພນດ້າ ພຽງແຕ່ທ່ານສັ່ງຂັ້ນຕໍ່າ 60,000 ກີບຫຼັງຈາກໃຊ້ສ່ວນຫລຸດ, ທ່ານກໍ່ມີສິດລຸ້ນຮັບຂອງລາງວັນດັ່ງກ່າວແລ້ວ! ຍິ່ງສັ່ງຫຼາຍເທົ່າໃດ ຍິ່ງມີສິດລຸ້ນຮັບຫຼາຍເທົ່ານັ້ນ! 🤩✨",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
