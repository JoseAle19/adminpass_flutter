// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba/models/responseapi.dart';
import 'package:prueba/providers/usersprovider.dart';

class LoginController extends GetxController {
  final TextEditingController emailctrl = TextEditingController();
  final TextEditingController passwordctrl = TextEditingController();
  UserProvider _userProvider = UserProvider();
  void login() async {
    String email = emailctrl.text.trim();
    String password = passwordctrl.text.trim();

    if (isinputsvalid(email, password)) {
      ResponseApi responseapi = await _userProvider.login(email, password);
      if (responseapi.success == false) {
        Get.snackbar("Error al iniciar sesion", responseapi.message ?? "",
            icon: const Icon(
              Icons.error,
              color: Colors.red,
            ),
            backgroundColor: const Color.fromARGB(145, 245, 189, 186),
            duration: const Duration(seconds: 2));
      } else {
        Get.snackbar(responseapi.message ?? "", responseapi.data,
            icon: const Icon(
              Icons.star,
              color: Colors.green,
            ),
            backgroundColor: const Color.fromARGB(145, 173, 239, 190),
            duration: const Duration(seconds: 2));
      }
    }
  }

  void gotoregister() {
    Get.offAndToNamed("registerpage");
  }

  bool isinputsvalid(String email, String password) {
    if (email.isEmpty) {
      Get.snackbar("Correo invalido", "Correo vacio");
      return false;
    }
    if (!GetUtils.isEmail(email)) {
      Get.snackbar("Correo invalido", "Correo no valido");
      return false;
    }
    if (password.isEmpty) {
      Get.snackbar("Contraseña invalida", "Contraseña vacia");
      return false;
    }
    return true;
  }
}
