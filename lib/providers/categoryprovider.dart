import 'package:get/get.dart';
import 'package:prueba/models/category.dart';

import '../enviroments/enviroments.dart';

class CategoryProvider extends GetConnect {
  final url = Enviroments.MY_API;
  Future<Response> registercategory(Category category) async {
    Response response = await post(url + "/createcategory", category.toJson(),
        headers: {"Content-Type": "application/json"});
    return response;
  }
}
