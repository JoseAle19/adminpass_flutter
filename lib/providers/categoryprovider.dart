// ignore_for_file: prefer_interpolation_to_compose_strings
 

import 'package:get/get.dart';
import 'package:prueba/models/category.dart';
import 'package:prueba/models/categorys.dart';

import '../enviroments/enviroments.dart';

class CategoryProvider extends GetConnect {
  List<DataCategory> items = [];

  final url = Enviroments.MY_API;
  Future<Response> registercategory(Category category) async {
    Response response = await post(
        url + "/category/createcategory", category.toJson(),
        headers: {"Content-Type": "application/json"});
    return response;
  }
}
