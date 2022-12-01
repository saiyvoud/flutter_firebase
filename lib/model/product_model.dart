import 'dart:convert';


class ProductModel {
  // parameter ພາຍນອກ: ຫມາຍເຖິງຕົວປ່ຽນຫລືຂໍ້ມູນທີ່ແທນດ້ວຍຕົວອັກ
  final String? id;
  final String? name;
  final String? desc;
  final String? price;
  final String? image;

// parameter ພາຍໃນ: ຫມາຍເຖິງຕົວປ່ຽນຫລືຂໍ້ມູນທີ່ແທນດ້ວຍຕົວອັກ
  ProductModel({
    this.id,
    this.name,
    this.desc,
    this.price,
    this.image,
  });
  // ເປັນການສ້າງ from ຂໍ້ມູນເພື່ອເອົາໄປໃສ່ງານ
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        price: json["price"],
        image: json["image"],
      );
// ເປັນການສົ່ງຂໍ້ມູນກັບຄືນຫາ firebase
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "image": image,
      };
}
