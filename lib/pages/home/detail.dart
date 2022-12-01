// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final ProductModel productModel;
  const Detail({Key? key, required this.productModel}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Product Detail"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      bottomNavigationBar: Container(
          height: 200,
          decoration: BoxDecoration(color: Colors.red),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: 60,
                  width: 160,
                  decoration: BoxDecoration(color: Colors.green),
                  child: Text("Add to Cart"),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 60,
                  width: 160,
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text("Buy Now"),
                ),
              ),
            ],
          )),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image.network("${widget.productModel.image}",
              height: 200, fit: BoxFit.cover),
          SizedBox(height: 20),
          Text(
            "${widget.productModel.name}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "${widget.productModel.desc}",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Row(
            children: [Text("Price"), Text("${widget.productModel.price}₭")],
          ),
        ],
      )),
    );
  }
}
