import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prueba/models/User.dart';

class HomePageController extends GetxController {
  User user = User.fromJson(GetStorage().read("user") ?? {});

  HomePageController() {
    print("Usuario logeado es ${user.toJson()}");
  }

  void logout() {
    GetStorage().remove("user");
    Get.offAllNamed("/loginpage");
  }
  void gotoprofile(){
    Get.toNamed("/profilepage");
  }
}
