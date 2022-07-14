// ignore_for_file: prefer_interpolation_to_compose_strings, non_constant_identifier_names


import 'package:get/get.dart';
import 'package:prueba/enviroments/enviroments.dart';
import 'package:prueba/models/user.dart';
import 'package:prueba/models/responseapi.dart';

class UserProvider extends GetConnect {
  final url = Enviroments.MY_API;

  Future<Response> registernewuser(User user) async {
    Response response = await post(url + "/newuser", user.toJson(), headers: {
      "Content-Type": "application/json"
    });//Esoera hasta que el servidor de node retorne un valor
    return response;
  }

  Future<ResponseApi> login(String email, String password) async {
    Response response = await post(
        url + "/login", 
        {"email": email, "password": password},
        headers: {"Content-Type": "application/json"});
    if (response.body == null) {
      {
        Get.snackbar("Error", "Porfavor verifique su servidor");
        return ResponseApi();
      }
    }
    ResponseApi responseapi = ResponseApi.fromJson(response.body);
    print(responseapi);
    return responseapi;
  }
}
