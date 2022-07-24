// ignore_for_file: prefer_const_declarations, prefer_interpolation_to_compose_strings, unnecessary_brace_in_string_interps, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prueba/models/user.dart';
import 'package:prueba/models/category.dart';
import 'package:prueba/providers/categoryprovider.dart';
import 'package:http/http.dart' as http;

import '../../enviroments/enviroments.dart';
import '../../models/categorys.dart';

class CategoryController extends GetxController {
  List<DataCategory> item = [];
  List statelist = [];

  TextEditingController categoryctrl = TextEditingController();
  CategoryProvider categoryProvider = CategoryProvider();
  User user = User.fromJson(GetStorage().read("user") ?? {});
  final url = Enviroments.MY_API;

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
      Category category =
          Category(descriptionCategory: namecategory, idUsers: user.iduser);
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

  Future<List<DataCategory>> getcategorys() async {
    final urlok = Uri.parse(url + "/category/getcategorys/${user.iduser}");
    final response = await http.get(urlok);
    final decodeata = json.decode(response.body);
    final categoryss = DataCategorys.jsonFromList(decodeata["data"]);
    item.addAll(categoryss.itemcategorys);
    statelist = item;
    return categoryss.itemcategorys;
  }

  void deletecategory(idcate, iduser) async {
    final urlok =
        Uri.parse(url + "/category/deletecategory/$idcate}/${iduser}");
    final response = await http.delete(urlok);
  }

  void gotocreatenote() {
    Get.toNamed("/notepage");
  }
}
