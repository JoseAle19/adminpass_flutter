import 'dart:convert';

import 'package:get/get.dart';
import 'package:prueba/enviroments/enviroments.dart';
import 'package:prueba/models/responseapi.dart';

class UserProvider extends GetConnect {
  final url = Enviroments.MY_API;

  Future registernewuser(
    String email,
    String password,
    String name,
    String lastname,
    String phone,
    String age,
    String Qsecret,
  ) async {
    final mybody = {
      "email": email,
      "password": password,
      "name": name,
      "lastname": lastname,
      "phone": phone,
      "age": age,
      "question": Qsecret,
    };

    final jsonbody = json.encode(mybody);

    final response = await post(url + "/newuser", jsonbody,
        headers: {"Content-Type": "application/json"});
    if (response.body == null) {
      Get.snackbar("Error del registro", "Porfavor verifique el servidor");
      return [];
    } else {
      final responseapi = jsonDecode(response.body);
      return responseapi;
    }
  }

  Future<ResponseApi> login(String email, String password) async {
    Response response = await post(
        url + "/login", {"email": email, "password": password},
        headers: {"Content-Type": "application/json"});
    if (response.body == null) {
      {
        Get.snackbar("Error", "Porfavor verifique su servidor");
        return ResponseApi();
      }
    }
    ResponseApi responseapi = ResponseApi.fromJson(response.body);
    return responseapi;
  }
}
