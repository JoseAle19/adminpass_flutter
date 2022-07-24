// ignore_for_file: prefer_const_declarations, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:prueba/models/notes.dart';

import '../../enviroments/enviroments.dart';
import '../../models/user.dart';

class HomePageController extends GetxController {
  List<DataNote> item = [];
  String? valuedropdown;
  void logout() {
    GetStorage().remove("user");
    Get.offAllNamed("/loginpage");
  }

  void gotoprofile() {
    Get.toNamed("/profilepage");
  }

  void gotocreatenote() {
    Get.toNamed("/notepage");
  }

  void gotogetcategorys() {
    Get.toNamed("/getcategorys");
  }

  void gotocreatecategory() {
    Get.toNamed("/createnewcategory");
  }

  Future<List<DataNote>> getnotes() async {
    User user = User.fromJson(GetStorage().read("user") ?? {});
    final url = Enviroments.MY_API;
    final urlok = Uri.parse(url + "/note/getnote/${user.iduser}");
    final response = await http.get(urlok);
    final decodeata = json.decode(response.body);
    final note = DataNotes.jsonFromList(decodeata["data"]);
    item.addAll(note.itemnotes);
    return note.itemnotes;
  }
}
