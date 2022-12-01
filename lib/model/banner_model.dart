class BannerModel {
  // parameter ພາຍນອກ: ຫມາຍເຖິງຕົວປ່ຽນຫລືຂໍ້ມູນທີ່ແທນດ້ວຍຕົວອັກ
  final String? id;
  final String? name;
  final String? desc;
  final String? image;

// parameter ພາຍໃນ: ຫມາຍເຖິງຕົວປ່ຽນຫລືຂໍ້ມູນທີ່ແທນດ້ວຍຕົວອັກ
  BannerModel({
    this.id,
    this.name,
    this.desc,
    this.image,
  });
  // ເປັນການສ້າງ from ຂໍ້ມູນເພື່ອເອົາໄປໃສ່ງານ
  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        image: json["image"],
      );
// ເປັນການສົ່ງຂໍ້ມູນກັບຄືນຫາ firebase
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "image": image,
      };
}
