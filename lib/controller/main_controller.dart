// ignore_for_file: avoid_print, invalid_return_type_for_catch_error, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/banner_model.dart';
import 'package:e_commerce_app/model/cart_model.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MainController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var isLoading = false.obs;
  var isCartLoading = false.obs;
  var productList = <ProductModel>[].obs;
  var cartList = <CartModel>[].obs;
  var bannerList = <BannerModel>[].obs;
  @override
  void onInit() async {
    super.onInit();
    await fetchProducts();
  }

  login(email, password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        // if success go to home page
        Get.offAllNamed("/home");
      }).catchError((e) => {print(e)});
    } catch (e) {
      print(e);
    }
  }

  logout() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  register(firstname, lastname, email, password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        String id = value.user!.uid;
        firestore.collection("user").doc(id).set({
          "firstname": firstname,
          "lastname": lastname,
          "email": email,
        }).then((value) => {
              Get.toNamed("/home"),
            });
      });
    } catch (e) {
      print(e);
    }
  }

  fetchProducts() async {
    isLoading(true);
    try {
      final QuerySnapshot querySnapshot =
          await firestore.collection("products").get();
      productList.clear();
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        var product = querySnapshot.docs[i];
        productList.add(ProductModel(
          id: product.id,
          name: product["name"],
          desc: product["desc"],
          price: product["price"],
          image: product["image"],
        ));
      }
      isLoading(false);
      update();
    } catch (e) {
      Get.snackbar("Error", "${e.toString()}",
          backgroundColor: Colors.green, colorText: Colors.white);
    }
  }

  // Future<void> remove() async {
  //   await FirebaseFirestore.instance.collection('favorite').doc().delete();
  // }

}
