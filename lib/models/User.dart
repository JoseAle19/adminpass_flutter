// ignore_for_file: file_names

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.email,
    this.iduser,
    this.password,
    this.name,
    this.lastName,
    this.phone,
    this.age,
    this.answerques,
  });

  String? iduser;
  String? email;
  String? password;
  String? name;
  String? lastName;
  String? phone;
  String? age;
  String? answerques;

  factory User.fromJson(Map<String, dynamic> json) => User(
        iduser: json["id_user"].toString(),
        email: json["email"],
        password: json["password"],
        name: json["name"],
        lastName: json["last_name"],
        phone: json["phone"],
        age: json["age"].toString(),
        answerques: json["answerques"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "id_user": iduser,
        "password": password,
        "name": name,
        "last_name": lastName,
        "phone": phone,
        "age": age,
        "answerques": answerques,
      };
}
