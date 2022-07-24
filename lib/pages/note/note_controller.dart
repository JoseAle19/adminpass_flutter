// ignore_for_file: unused_local_variable, prefer_interpolation_to_compose_strings, unnecessary_brace_in_string_interps

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prueba/models/notemodel.dart';
import 'package:prueba/models/user.dart';
import 'package:prueba/providers/noteprovider.dart';
import 'package:http/http.dart' as http;

import '../../enviroments/enviroments.dart';

class NoteController extends GetxController {
  User myuser = User.fromJson(GetStorage().read("user") ?? {});
  TextEditingController titlecrtl = TextEditingController();
  TextEditingController emailctrl = TextEditingController();
  TextEditingController passwordctrl = TextEditingController();
  String? valuedrop;
  final url = Enviroments.MY_API;

  NoteProvider noteProvider = NoteProvider();
  //crean la nota
  void createnote() async {
    String tittle = titlecrtl.text.trim();
    String email = emailctrl.text.trim();
    String password = passwordctrl.text.trim();
    if (isvalid(tittle, email, password)) {
      Note note = Note(
          tittle: tittle,
          email: email,
          password: password,
          typecategory: valuedrop ?? "");
      Response response =
          await noteProvider.crearenote(note, myuser.iduser ?? "");
      if (response.body["success"] == true) {
        Get.snackbar("Nota creada", response.body["message"],
            backgroundColor: const Color.fromARGB(225, 87, 209, 91));
        titlecrtl.text = "";
        emailctrl.text = "";
        passwordctrl.text = "";
      } else {}
    }
  }

  //actualiza la nota
  void updatenote(String idnote, String typecategnote) async {
    String tittle = titlecrtl.text.trim();
    String email = emailctrl.text.trim();
    String password = passwordctrl.text.trim();
    if (isvalidupdate(tittle, email, password)) {
      Note note = Note(
          tittle: tittle,
          email: email,
          password: password,
          typecategory: typecategnote);

      Response response =
          await noteProvider.updatenote(note, myuser.iduser ?? "", idnote);
      if (response.body["success"] == true) {
        Get.snackbar(
          "Nota Atcualizada",
          response.body["message"],
          backgroundColor: const Color.fromARGB(225, 87, 209, 91),
        );
        gotohome();
        titlecrtl.text = "";
        emailctrl.text = "";
        passwordctrl.text = "";
      } else {
        Get.snackbar(
            "Error", "No se pudo actualizar la nota, verifica tu servidor",
            backgroundColor: const Color.fromARGB(197, 255, 56, 42));
      }
    }
  }

  void gotohome() {
    Get.toNamed("/homepage");
  }

  bool isvalid(String tittle, String email, String password) {
    if (tittle.isEmpty) {
      Get.snackbar("Error", "titulo no puede estar vacio");
      return false;
    }
    if (email.isEmpty) {
      Get.snackbar("Error", "Email no puede estar vacio");
      return false;
    }
    if (password.isEmpty) {
      Get.snackbar("Error", "Contraseña no puede estar vacio");
      return false;
    }
    return true;
  }

  bool isvalidupdate(String tittle, String email, String password) {
    if (tittle.isEmpty) {
      Get.snackbar("Error", "titulo no puede estar vacio");
      return false;
    }
    if (email.isEmpty) {
      Get.snackbar("Error", "Email no puede estar vacio");
      return false;
    }
    if (password.isEmpty) {
      Get.snackbar("Error", "Contraseña no puede estar vacio");
      return false;
    }
    return true;
  }

  void deletenote(idnote) async {
    final urlok =
        Uri.parse(url + "/note/deletenote/${myuser.iduser}/${idnote}");
    final response = await http.delete(urlok);
  }

  void gotoupdatenote() {
    Get.toNamed("/noteupdate");
  }
}
