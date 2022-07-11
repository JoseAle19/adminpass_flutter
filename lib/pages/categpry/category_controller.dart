import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba/models/category.dart';
import 'package:prueba/providers/categoryprovider.dart';

class CategoryController extends GetxController {
  TextEditingController categoryctrl = TextEditingController();
  CategoryProvider categoryProvider = CategoryProvider();
  void addcategory() async {
    String namecategory = categoryctrl.text.trim();

    if (namecategory.isEmpty) {
      Get.snackbar(
        "Error al agregar",
        "La categoria no puede estar vacia",
        backgroundColor: Color.fromARGB(183, 236, 78, 66),
        icon: const Icon(Icons.error),
        duration: const Duration(seconds: 2),
      );
    } else {
      Category category = Category(decriptionCategory: namecategory);
      Response response = await categoryProvider.registercategory(category);

      print(response.body);
    }
  }
}
