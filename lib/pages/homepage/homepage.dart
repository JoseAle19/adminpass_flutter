import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageController conhome = Get.put(HomePageController());
    const draweheader = UserAccountsDrawerHeader(
      margin: EdgeInsets.only(right: 100),
      accountName: Text("tecnofull"),
      accountEmail: Text("tecnofull@gmail.com"),
      currentAccountPicture: CircleAvatar(
        child: Icon(
          Icons.person,
          size: 60,
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
                  Get.toNamed("/createnewcategory");
                },
                leading: const Icon(Icons.category),
                title: const Text("Crear categoria"),
              ),
              ListTile(
                onTap: () {
                  conhome.logout();
                },
                leading: const Icon(Icons.category),
                title: const Text("Cerrar sesion"),
              ),
              ListTile(
                onTap: () {
                  conhome.gotocreatenote();
                },
                leading: const Icon(Icons.category),
                title: const Text("Crear nota"),
              ),
            ],
          ),
        ))
      ],
    );
    return Scaffold(
      appBar: AppBar(
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
