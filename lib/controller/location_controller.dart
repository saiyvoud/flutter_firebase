// ignore_for_file: prefer_collection_literals

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future<void> addLocation({
    required String address,
    required String type,
    required double lat,
    required double lng,
  }) async {
    try {
      await firestore.collection('location').doc().set({
        'address': address,
        'type': type,
        'location': GeoPoint(lat, lng),
        'userId': auth.currentUser!.uid,
      }).then((value) {
        Get.snackbar(
          "add",
          "add location succesful",
          colorText: Colors.white,
          backgroundColor: Colors.green,
        );
      });
    } catch (e) {
      Get.snackbar(
        "error",
        e.toString(),
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }
}
