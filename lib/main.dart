import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba/pages/login/loginpage.dart';
import 'package:prueba/pages/register/register_page.dart';

import 'pages/homepage.dart';
import 'widgets/createategory.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NOTAS",
      initialRoute: "/homepage",
      getPages: [
        GetPage(name: "/loginpage", page: () => const LoginPage()),
        GetPage(name: "/registerpage", page: () => const RegisterPage()),
        GetPage(name: "/homepage", page: () => HomePage()),
        GetPage(
            name: "/createnewcategory", page: () => const CreateNewCatetgory()),
      ],
    );
  }
}
