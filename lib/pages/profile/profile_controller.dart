// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prueba/models/user.dart';
import 'package:prueba/providers/usersprovider.dart';

class ProfileController extends GetxController {
  User myuser = User.fromJson(GetStorage().read("user") ?? {});
  UserProvider userProvider = UserProvider();
TextEditingController emailctrl = TextEditingController();
  TextEditingController passwordctrl = TextEditingController();
  TextEditingController namectrl = TextEditingController();
  TextEditingController lastnamectrl = TextEditingController();
  TextEditingController phonectrl = TextEditingController();
  TextEditingController agectrl = TextEditingController();
  TextEditingController answerquesctrl = TextEditingController();

  void Updateuser() async {
    String email = emailctrl.text;
    String password = passwordctrl.text;
    String name = namectrl.text;
    String lastname = lastnamectrl.text;
    String phone = phonectrl.text;
    String age = agectrl.text;
    String answerques = answerquesctrl.text;

    User user = User(
        email: email,
        password: password,
        name: name,
        lastName: lastname,
        phone: phone,
        age: age,
        answerques: answerques);

    // if (adddatauser(password, name, lastname, phone, age, answerques)) {
      Response response = await userProvider.updateuser(user);

      if (response.body["success"] == true) {
        Get.snackbar("Datos actualizados", response.body["message"],
            backgroundColor: const Color.fromARGB(225, 87, 209, 91));
        logout();
      } else {
        Get.snackbar("Error al actualizar", response.body["message"],
            backgroundColor: const Color.fromARGB(205, 233, 80, 69));
      }
    // }
  }

  bool adddatauser( String password, String name, String lastname,
      String phone, String age, String ques) {
    if (password.isEmpty) {
      Get.snackbar("Error", "Contraseña vacia");
      return false;
    }

    if (name.isEmpty) {
      Get.snackbar("Error", "Nombre vacio");
      return false;
    }
    if (lastname.isEmpty) {
      Get.snackbar("Error", "Apellido vacio");
      return false;
    }
    if (phone.isEmpty) {
      Get.snackbar("Error", "Telefono");
      return false;
    }
    if (phone.length != 10) {
      Get.snackbar("Error", "El numero de telefono debe ser a 10 digitos");
      return false;
    }
    if (age.isEmpty) {
      Get.snackbar("Error", "Edad vacia");
      return false;
    }
    if (age.length > 3) {
      Get.snackbar("Error", "Edad Incorrecta");
      return false;
    }

    if (ques.isEmpty) {
      Get.snackbar("Error", "Coloca una respuesta de seguridad");
      return false;
    }
    return true;
  }

  void logout() {
    GetStorage().remove("user");
    Get.offAllNamed("/loginpage");
  }
}
