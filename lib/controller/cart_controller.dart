// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final List cart = [].obs;
  final List listCartModel = <CartModel>[].obs;
  var totalPrice = 0.0;
  dynamic listCart = [].obs;
  var isCartLoading = false.obs;
  var loading = false.obs;
  Future removeCart() async {}
  Future getCartHome() async {
    isCartLoading(true);
    try {
      final QuerySnapshot querySnapshot = await firestore
          .collection("cart")
          .where("userID", isEqualTo: auth.currentUser!.uid)
          .get();
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        listCart = querySnapshot.docs;
      }
      isCartLoading(false);
      update();
    } catch (e) {
      Get.snackbar("Error", "get cart",
          backgroundColor: Colors.red, colorText: Colors.white);
      isCartLoading(false);
      update();
    }
  }

  Future getCart() async {
    loading(true);
    try {
      final QuerySnapshot querySnapshot = await firestore
          .collection("cart")
          .where("userID", isEqualTo: auth.currentUser!.uid)
          .get();
      listCartModel.clear();
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        var data = querySnapshot.docs[i];
        totalPrice += int.parse(querySnapshot.docs[i]['price']);
        listCartModel.add(CartModel(
          id: data.id,
          name: data['name'],
          amount: data['amount'].toString(),
          desc: data['desc'],
          price: data['price'],
          userID: auth.currentUser!.uid,
          productID: data['productID'],
          image: data['img'],
        ));
      }

      loading(false);
      update();
    } catch (e) {
      Get.snackbar("Error", "get cart",
          backgroundColor: Colors.red, colorText: Colors.white);
      loading(false);
      update();
    }
  }

  addProductToCart(productID, userID, name, desc, price, img) async {
    cart.clear();
    try {
      firestore.collection("cart").get().then((value) async {
        value.docs.forEach((element) {
          cart.add(element.id);
        });
        if (cart.contains(productID)) {
          firestore.collection("cart").doc(productID).get().then((data) {
            data.reference
                .update({"amount": data.data()!["amount"] + 1}).then((value) {
              Get.snackbar("update", "update amount in cart",
                  backgroundColor: Colors.amber, colorText: Colors.white);
            });
          });
        } else {
          firestore.collection("cart").doc(productID).set({
            "productID": productID,
            "userID": userID,
            "name": name,
            "desc": desc,
            "amount": 1,
            "price": price,
            "img": img
          }).then((value) async {
            await getCartHome();
            update();
            Get.snackbar("add", "add amount in cart",
                backgroundColor: Colors.green, colorText: Colors.white);
          });
        }
      });
    } catch (e) {
      Get.snackbar("Error", "add amount in cart",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
