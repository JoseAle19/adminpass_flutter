import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prueba/models/User.dart';
import 'package:prueba/pages/login/loginpage.dart';
import 'package:prueba/pages/profile/profilepage.dart';
import 'package:prueba/pages/register/register_page.dart';

import 'pages/homepage/homepage.dart';
import 'widgets/createategory.dart';

User myuser = User.fromJson(GetStorage().read("user") ?? {});
void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NOTAS",
      initialRoute: myuser.email != null ? "/homepage" : "/loginpage",
      //signo de pregunta(?) significa entonces id ternario y dos(??) si es null
      getPages: [
        GetPage(name: "/loginpage", page: () => const LoginPage()),
        GetPage(name: "/registerpage", page: () => const RegisterPage()),
        GetPage(name: "/homepage", page: () => HomePage()),
        GetPage(
            name: "/createnewcategory", page: () => const CreateNewCatetgory()),
        GetPage(name: "/profilepage", page: () => const ProfilePage()),
      ],
    );
  }
}
