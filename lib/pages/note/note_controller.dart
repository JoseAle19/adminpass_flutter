import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/retry.dart';

class NoteController extends GetxController {
  TextEditingController titlecrtl = TextEditingController();
  TextEditingController descripcrtl = TextEditingController();
  String? valuedrop;

  bool isvalid() {
    print(valuedrop);
    String title = titlecrtl.text.trim();
    String descrip = descripcrtl.text.trim();
    if (valuedrop == null) {
      Get.snackbar("Error", "Selecciona una categoria");
      return false;
    }
    if (title.isEmpty) {
      Get.snackbar("Error", "titulo no puede estar vacio");
      return false;
    }
    if (descrip.isEmpty) {
      Get.snackbar("Error", "Descripcion no puede estar vacio");
      return false;
    }
    return true;
  }
}
