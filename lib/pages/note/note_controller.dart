import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NoteController extends GetxController {
  TextEditingController titlecrtl = TextEditingController();
  TextEditingController descripcrtl = TextEditingController();

  void isvalid() {
    String title = titlecrtl.text.trim();
    String descrip = descripcrtl.text.trim();
    if (title.isEmpty) {
      Get.snackbar("Error", "titulo no puede estar vacio");
    }
    if (descrip.isEmpty) {
      Get.snackbar("Error", "Descripcion no puede estar vacio");
    }
  }
}
