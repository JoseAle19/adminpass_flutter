// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba/models/user.dart';
import 'package:prueba/providers/usersprovider.dart';

class RegisterController extends GetxController {
  final TextEditingController emailctrl = TextEditingController();
  final TextEditingController passwordctrl = TextEditingController();
  final TextEditingController confirmpasswrdctrl = TextEditingController();
  final TextEditingController namectrl = TextEditingController();
  final TextEditingController lastnamectrl = TextEditingController();
  final TextEditingController phonectrl = TextEditingController();
  final TextEditingController agectrl = TextEditingController();
  final TextEditingController questionctrl = TextEditingController();
  //
  UserProvider userprovider = UserProvider(); //  instancia de la petcion http
  //

  void registeruser() async {
    String email = emailctrl.text.trim();
    String password = passwordctrl.text.trim();
    String confirmpass = confirmpasswrdctrl.text.trim();
    String name = namectrl.text.trim();
    String lastname = lastnamectrl.text.trim();
    String phone = phonectrl.text.trim();
    String age = agectrl.text.trim();
    String answerques = questionctrl.text.trim();
    if (isvalidfields(
        email, password, confirmpass, name, lastname, phone, age, answerques)) {
      User user = User(
        email: email,
        password: password,
        name: name,
        lastName: lastname,
        phone: phone,
        age: age,
        answerques: answerques,
      );
      Response response = await userprovider.registernewuser(user);


      if (response.body["success"] == true) {
        Get.snackbar(
          "Cuenta creada",
          "Por favor registrate",
          backgroundColor: const Color.fromARGB(190, 76, 175, 79),
          icon: const Icon(Icons.verified_user),
        );
        Get.offAndToNamed("/loginpage");
      } else {
        Get.snackbar("Error al crear tu cuenta", response.body["message"],
            backgroundColor: const Color.fromARGB(195, 238, 97, 87),
            icon: const Icon(Icons.error));
      }
    }
  }

  void gotologin() {
    Get.offAndToNamed("/loginpage");
  }

  bool isvalidfields(String email, String password, String confirmpass,
      String name, String lastname, String phone, String age, String ques) {
    if (email.isEmpty) {
      Get.snackbar("Error en el registro", "Correo vacio");
      return false;
    }
    if (!GetUtils.isEmail(email)) {
      Get.snackbar("Error en el registro", "Correo invalido");
      return false;
    }
    if (password.isEmpty) {
      Get.snackbar("Error en el registro", "Contraseña vacia");
      return false;
    }
//     if (confirmpass.isEmpty) {
//       Get.snackbar("Error en el registro", "Confirma contraseña");
//       return false;
//     }
// //comparar contraseñas

//     if (confirmpass != password) {
//       Get.snackbar("Error", "Las contraseñas no coinciden");
//       return false;
//     }
    if (name.isEmpty) {
      Get.snackbar("Error en el registro", "Nombre vacio");
      return false;
    }
    if (lastname.isEmpty) {
      Get.snackbar("Error en el registro", "Apellido vacio");
      return false;
    }
    if (phone.isEmpty) {
      Get.snackbar("Error en el registro", "Numero de telefono vacio");
      return false;
    }
    if (phone.length != 10) {
      Get.snackbar(
          "Error en el registro", "Numero de telefono debe ser a 10 digitos");
      return false;
    }
    if (age.isEmpty) {
      Get.snackbar("Error en el registro", "Edad vacia");
      return false;
    }
    if (ques.isEmpty) {
      Get.snackbar("Error en el registro", "Respuesta de seguridad vacia");
      return false;
    }

    return true;
  }
}
