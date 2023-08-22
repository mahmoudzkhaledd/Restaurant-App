class UserModel {
  late String id;
  late String firstName;
  late String middleName;
  late String lastName;
  late String email;
  late String photoUrl;
  late String password;
  late String phone;
  late int discount;
  List<UserAddress> addresses = [];

  bool validateInput() {
    return firstName.isNotEmpty &&
        middleName.isNotEmpty &&
        lastName.isNotEmpty &&
        phone.isNotEmpty &&
        addresses.isNotEmpty &&
        addresses[0].city.isNotEmpty &&
        addresses[0].street.isNotEmpty &&
        addresses[0].building.isNotEmpty;
  }

  UserModel.empty() {
    id = "";
    firstName = "";
    middleName = "";
    lastName = "";
    email = "";
    phone = "";
    password = "";
    photoUrl = "";
    discount = 0;
  }

  UserModel.fromJson(Map<String, dynamic> mp) {
    id = mp['id'] ?? "";
    firstName = mp['firstName'] ?? "";
    middleName = mp['lastName'] ?? "";
    lastName = mp['middleName'] ?? "";
    email = mp['email'] ?? "";
    photoUrl = mp['photoUrl'] ?? "";
    phone = mp['phone'] ?? "";
    if (mp['address'] != null) {
      for (var add in mp['address']) {
        addresses.add(UserAddress.fromJson(add));
      }
    }
    discount = mp['discount'] ?? 0;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "middleName": middleName,
        "email": email,
        "photoUrl": photoUrl,
        "phone": phone,
        "address":
            addresses.map<Map<String, dynamic>>((e) => e.toJson()).toList(),
        "discount": discount,
      };
}

class UserAddress {
  String city = "";
  String street = "";
  String building = "";

  UserAddress();

  UserAddress.fromJson(Map<String, dynamic> mp) {
    city = mp['city'];
    street = mp['street'];
    building = mp['building'];
  }

  Map<String, dynamic> toJson() => {
        "city": city,
        "street": street,
        'building': building,
      };
}
