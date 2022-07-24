// To parse this JSON data, do
//
//     final note = noteFromJson(jsonString);

import 'dart:convert';

Note noteFromJson(String str) => Note.fromJson(json.decode(str));

String noteToJson(Note data) => json.encode(data.toJson());

class Note {
  Note({
    required this.tittle,
    required this.email,
    required this.password,
    required this.typecategory,
  });

  String tittle;
  String email;
  String password;
  String typecategory;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        tittle: json["tittle"],
        email: json["email"],
        password: json["password"],
        typecategory: json["typecategory"],
      );

  Map<String, dynamic> toJson() => {
        "tittle": tittle,
        "email": email,
        "password": password,
        "typecategory": typecategory,
      };
}
