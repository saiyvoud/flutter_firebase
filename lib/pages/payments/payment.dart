// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('payment'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.call, color: Colors.purple),
                  SizedBox(width: 5),
                  Text('ຊ່ອງທາງຕິດຕໍ່',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(),
                  Icon(Icons.edit, color: Colors.green),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ຊື່ ແລະ ນາມສະກຸນ',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    Text('ຊາຍວຸດ ໂສມນະນົງ',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ເບີໂທຕິດຕໍ່',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    Text('+856 2096794376',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ເອີເມວຕິດຕໍ່',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    Text('saiyvouds@gmail.com',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 10,
                decoration: BoxDecoration(color: Colors.grey.shade100),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.time_to_leave, color: Colors.purple),
                  SizedBox(width: 5),
                  Text('ເວລາຈັດສົ່ງສິນຄ້າ',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(),
                  Icon(Icons.edit, color: Colors.green),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ວັນທີ່ຈັດສົ່ງ',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    Text('10-01-2023',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ເວລາຈັດສົ່ງ',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    Text('10:00 - 20:00',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 10,
                decoration: BoxDecoration(color: Colors.grey.shade100),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.map, color: Colors.purple),
                  SizedBox(width: 5),
                  Text('ສະຖານທີ່ຈັດສົ່ງສິນຄ້າ',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Get.toNamed('/location');
                    },
                    icon: Icon(Icons.edit, color: Colors.green),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ບ້ານ ເມືອງ ແຂວງ',
                            style: TextStyle(fontSize: 12, color: Colors.black)),
                        Text('ຫ້ວຍຫົງ ຈັນທະບູລີ ນະຄອນຫຼວງວຽງຈັນ',
                            style: TextStyle(fontSize: 12, color: Colors.black)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ປະເພດທີ່ຢູ່ອາໄສ',
                            style: TextStyle(fontSize: 12, color: Colors.black)),
                        Text('ບ້ານ',
                            style: TextStyle(fontSize: 12, color: Colors.black)),
                      ],
                    ),
                  ),
                ],
              ),
           
              SizedBox(height: 10),
              Container(
                height: 120,
                decoration: BoxDecoration(color: Colors.purple),
              ),
              SizedBox(height: 10),
              Container(
                height: 10,
                decoration: BoxDecoration(color: Colors.grey.shade100),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.list_alt, color: Colors.purple),
                  SizedBox(width: 5),
                  Text('ລາຍລະອຽກສິນຄ້າ',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Spacer(),
                  Icon(Icons.edit, color: Colors.green),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ຊື່',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    Text('ຈຳນວນ',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    Text('ລາຄາ',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ເສື້ອ',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    Text('1',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    Text('150,000 Kip',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ໂສ້ງ',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    Text('1',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    Text('150,000 Kip',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ລາຄາລວມ',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    Text('150,000 Kip',
                        style: TextStyle(fontSize: 15, color: Colors.red)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.purple,
        ),
        child: Center(
          child: Text(
            'ຊຳລະເງີນ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
