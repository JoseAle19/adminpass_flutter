// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
    Category({
        this.descriptionCategory,
        this.idUsers,
    });

    String? descriptionCategory;
    String? idUsers;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        descriptionCategory: json["Description_category"],
        idUsers: json["id_users"],
    );

    Map<String, dynamic> toJson() => {
        "Description_category": descriptionCategory,
        "id_users": idUsers,
    };
}
