import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prueba/pages/note/noteupdate.dart';
import 'pages/categpry/createategory.dart';
import 'pages/categpry/seecategorys.dart';
import 'pages/homepage/homepage.dart';
import 'pages/login/loginpage.dart';
import 'pages/note/notepage.dart';
import 'pages/profile/profilepage.dart';
import 'pages/register/register_page.dart';

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
      initialRoute: "/homepage",
      //signo de pregunta(?) significa entonces id ternario y dos(??) si es null
      // initialRoute: "/createnewcategory",
      getPages: [
        GetPage(name: "/loginpage", page: () => const LoginPage()),
        GetPage(name: "/registerpage", page: () => const RegisterPage()),
        GetPage(name: "/homepage", page: () => const HomePage()),
        GetPage(
            name: "/createnewcategory", page: () => const CreateNewCatetgory()),
        GetPage(name: "/profilepage", page: () => ProfilePage()),
        GetPage(name: "/notepage", page: () => const Notepage()),
        GetPage(name: "/getcategorys", page: () => ListCategorys()),
        GetPage(name: "/noteupdate", page: () => UpdateNote()),
      ],
    );
  }
}
