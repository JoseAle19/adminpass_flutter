// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prueba/models/user.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  User myuser = User.fromJson(GetStorage().read("user") ?? {});
  @override
  Widget build(BuildContext context) {
    HomePageController conhome = Get.put(HomePageController());
    final draweheader = UserAccountsDrawerHeader(
      decoration: const BoxDecoration(color: Color.fromARGB(255, 92, 93, 94)),
      margin: const EdgeInsets.only(right: 100),
      accountName: Text(myuser.name ?? ""),
      accountEmail: Text(myuser.email ?? ""),
      currentAccountPicture: const CircleAvatar(
        backgroundColor: Colors.black,
        child: Icon(
          Icons.person_pin,
          size: 60,
          color: Colors.white,
        ),
      ),
    );

    final listitems = Column(
      children: [
        draweheader,
        Expanded(
            child: Container(
          margin: const EdgeInsets.only(right: 100),
          color: Colors.white,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ListTile(
                onTap: () {
                  conhome.gotoprofile();
                },
                leading: const Icon(Icons.person),
                title: const Text("Ver perfil"),
              ),
              ListTile(
                onTap: () {
                conhome.gotocreatecategory();
                },
                leading: const Icon(Icons.clear_all_outlined),
                title: const Text("Crear categoria"),
              ),
              ListTile(
                onTap: () {
                  conhome.gotogetcategorys();
                },
                leading: const Icon(Icons.category),
                title: const Text("Ver categorias"),
              ),
              const SizedBox(
                height: 250,
              ),
              ListTile(
                onTap: () {
                  conhome.logout();
                },
                leading: const Icon(Icons.category),
                title: const Text("Cerrar sesion"),
              ),
            ],
          ),
        ))
      ],
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 93, 94),
        title: const Text("Administrador de contraseñas"),
        centerTitle: true,
      ),
      drawer: listitems,
    );
  }

  Widget listtiles(Widget myicon, String mytext, context, String router) {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, router);
      },
      leading: myicon,
      title: const Text("mytext"),
    );
  }
}
