
class AppUser {
  String name;
  String? id;
  String email;
  String phone;
  String city;
  String? passWord;

  AppUser(
      {required this.name,
        required this.email,
        required this.city,
        required this.phone,
        this.id,
        this.passWord});
  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "name": name,
      "city": city,
      "email": email,
      "phone": phone,
    };
  }

  factory AppUser.fromMaP(Map<String, dynamic> map) {
    return AppUser(
        name: map["name"] ?? "",
        email: map["email"] ?? "",
        city: map["city"] ?? "",
        phone: map["phone"] ?? "");
  }
}