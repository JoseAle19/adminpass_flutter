import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    this.decriptionCategory,
  });

  String? decriptionCategory;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        decriptionCategory: json["Decription_category"],
      );

  Map<String, dynamic> toJson() => {
        "Decription_category": decriptionCategory,
      };
}
