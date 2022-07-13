import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prueba/models/user.dart';
import 'package:prueba/models/category.dart';
import 'package:prueba/providers/categoryprovider.dart';

class CategoryController extends GetxController {
  TextEditingController categoryctrl = TextEditingController();
  CategoryProvider categoryProvider = CategoryProvider();
User user = User.fromJson(GetStorage().read("user") ?? {});
  void addcategory() async {
    String namecategory = categoryctrl.text.trim();

    if (namecategory.isEmpty) {
      Get.snackbar(
        "Error al agregar",
        "La categoria no puede estar vacia",
        backgroundColor: const Color.fromARGB(183, 236, 78, 66),
        icon: const Icon(Icons.error),
        duration: const Duration(seconds: 2),
      );
    } else {
      Category category = Category(descriptionCategory: namecategory,
      idUsers: user.iduser);
      Response response = await categoryProvider.registercategory(category);

      if (response.body["success"] == false) {
        Get.snackbar(
          "Error al agregar",
          response.body["message"],
          backgroundColor: const Color.fromARGB(183, 236, 78, 66),
          icon: const Icon(Icons.error),
          duration: const Duration(seconds: 2),
        );
      } else {
        Get.snackbar(
          "Categoria agregada",
          response.body["message"],
          backgroundColor: const Color.fromARGB(190, 76, 175, 79),
          icon: const Icon(Icons.verified_user),
          duration: const Duration(seconds: 2),
        );
        categoryctrl.text = "";
      }
    }
  }
}
