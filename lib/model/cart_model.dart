class CartModel {
  // parameter ພາຍນອກ: ຫມາຍເຖິງຕົວປ່ຽນຫລືຂໍ້ມູນທີ່ແທນດ້ວຍຕົວອັກ
  final String? id;
  final String? productID;
  final String? name;
  final String? desc;
  final String? price;
  final String? image;
  final String? userID;
  final String? amount;

// parameter ພາຍໃນ: ຫມາຍເຖິງຕົວປ່ຽນຫລືຂໍ້ມູນທີ່ແທນດ້ວຍຕົວອັກ
  CartModel({
    this.id,
    this.productID,
    this.userID,
    this.amount,
    this.name,
    this.desc,
    this.price,
    this.image,
  });
  // ເປັນການສ້າງ from ຂໍ້ມູນເພື່ອເອົາໄປໃສ່ງານ
  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        productID: json["productID"],
        userID: json["userID"],
        amount: json["amount"],
        name: json["name"],
        desc: json["desc"],
        price: json["price"],
        image: json["image"],
      );
// ເປັນການສົ່ງຂໍ້ມູນກັບຄືນຫາ firebase
  Map<String, dynamic> toJson() => {
        "id": id,
        "productID": productID,
        "userID": userID,
        "amount": amount,
        "name": name,
        "desc": desc,
        "price": price,
        "image": image,
      };
}
