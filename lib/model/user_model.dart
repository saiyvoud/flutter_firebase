class UserModel {
  // parameter ພາຍນອກ: ຫມາຍເຖິງຕົວປ່ຽນຫລືຂໍ້ມູນທີ່ແທນດ້ວຍຕົວອັກ
  final String? userID;
  final String? email;
  final String? password;
  final String? firstname;
  final String? lastname;
  final String? profile;
// parameter ພາຍໃນ: ຫມາຍເຖິງຕົວປ່ຽນຫລືຂໍ້ມູນທີ່ແທນດ້ວຍຕົວອັກ
  UserModel(
      {this.userID,
      this.email,
      this.password,
      this.firstname,
      this.lastname,
      this.profile});
  // ເປັນການສ້າງ from ຂໍ້ມູນເພື່ອເອົາໄປໃສ່ງານ
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userID: json["userID"],
        email: json["email"],
        password: json["password"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        profile: json["profile"],
      );
// ເປັນການສົ່ງຂໍ້ມູນກັບຄືນຫາ firebase
  Map<String, dynamic> toJson() => {
        "userID": userID,
        "email": email,
        "password": password,
        "firstname": firstname,
        "lastname": lastname,
        "profile": profile,
      };
}
