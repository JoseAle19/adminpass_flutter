// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.email,
    this.id_user,
    this.password,
    this.name,
    this.lastName,
    this.phone,
    this.age,
    this.answerques,
  });

  String? id_user;
  String? email;
  String? password;
  String? name;
  String? lastName;
  String? phone;
  String? age;
  String? answerques;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id_user: json["id_user"].toString(),
        email: json["email"],
        password: json["password"],
        name: json["name"],
        lastName: json["Last_name"],
        phone: json["phone"],
        age: json["age"].toString(),
        answerques: json["answerques"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "id_user": id_user,
        "password": password,
        "name": name,
        "Last_name": lastName,
        "phone": phone,
        "age": age,
        "answerques": answerques,
      };
}
