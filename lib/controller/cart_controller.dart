// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final User? auth = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final List cart = [].obs;
  final List listCartModel = <CartModel>[].obs;
  var totalPrice = 0.obs;
  dynamic listCart = [].obs;
  var isCartLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getCart();
    await getTotalPrice();
  }

  Future<void> getTotalPrice() async {
    try {
      await firestore
          .collection("cart")
          .where("userID", isEqualTo: auth!.uid)
          .get()
          .then((value) {
        totalPrice = 0.obs;
        for (var total in value.docs) {
          totalPrice += total['amount'] * int.parse(total['price']);
        }
        update();
      });
    } catch (e) {
      Get.snackbar(
        "error get total pric",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future delete(data) async {
    try {
      await firestore
          .collection("cart")
          .doc(data.id)
          .delete()
          .then((value) async {
        Get.snackbar(
          "deletecart",
          "delete amount product in cart",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        await getTotalPrice();
        await getCart();

        update();
      });
    } catch (e) {
      Get.snackbar(
        "error cart",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> removeCart(data) async {
    try {
      await firestore.collection("cart").doc(data.id).update({
        "amount": data.amount - 1,
      }).then((value) async {
        Get.snackbar(
          "remove cart",
          "remove amount product in cart",
          backgroundColor: Colors.amber,
          colorText: Colors.white,
        );
        await getTotalPrice();
        await getCart();
        update();
      });
    } catch (e) {
      Get.snackbar(
        "error cart",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> addCart({
    required String id,
    required int amount,
  }) async {
    try {
      await firestore.collection("cart").doc(id).update({
        "amount": amount + 1,
      }).then((value) async {
        getCart();
        Get.snackbar(
          "Add cart",
          "Add amount product in cart",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        await getTotalPrice();
        update();
      });
    } catch (e) {
      Get.snackbar(
        "error cart",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> getCart() async {
    isCartLoading(true);
    try {
      final QuerySnapshot querySnapshot = await firestore
          .collection("cart")
          .where("userID", isEqualTo: auth!.uid)
          .get();
      listCartModel.clear();

      for (int i = 0; i < querySnapshot.docs.length; i++) {
        var data = querySnapshot.docs[i];

        listCartModel.add(CartModel(
          id: data.id,
          name: data['name'],
          amount: data['amount'],
          desc: data['desc'],
          price: data['price'],
          userID: auth!.uid,
          productID: data['productID'],
          image: data['img'],
        ));
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

  Future addProductToCart(productID, userID, name, desc, price, img) async {
    cart.clear();
    try {
      firestore
          .collection("cart")
          .where("userID", isEqualTo: auth!.uid)
          .get()
          .then((value) async {
        value.docs.forEach((element) {
          cart.add(element.id);
        });
        if (cart.contains(productID)) {
          firestore.collection("cart").doc(productID).get().then((data) {
            data.reference.update({"amount": data.data()!["amount"] + 1}).then(
                (value) async {
              Get.snackbar("update", "update amount in cart",
                  backgroundColor: Colors.amber, colorText: Colors.white);
              await getCart();
              await getTotalPrice();
              update();
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
            Get.snackbar("add", "add amount in cart",
                backgroundColor: Colors.green, colorText: Colors.white);
            await getCart();
            await getTotalPrice();
            update();
          });
        }
      });
    } catch (e) {
      Get.snackbar("Error", "add amount in cart",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
