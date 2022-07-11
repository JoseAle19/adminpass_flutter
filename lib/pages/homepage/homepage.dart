// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba/pages/homepage/home_controller.dart';

class HomePage extends StatelessWidget {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    HomePageController conhome = Get.put(HomePageController());

    final draweheader = UserAccountsDrawerHeader(
      margin: const EdgeInsets.only(right: 100),
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
                leading: Icon(Icons.person),
                title: const Text("Ver perfil"),
                onTap: () {
                  conhome.gotoprofile();
                },
              ),
              SizedBox(
                height: 250,
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: const Text("Salir"),
                onTap: () {
                  conhome.logout();
                },
              )
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
}
