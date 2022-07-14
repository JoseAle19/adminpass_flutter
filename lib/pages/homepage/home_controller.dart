import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomePageController extends GetxController {
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
}
