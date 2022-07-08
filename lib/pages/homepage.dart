// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  int page = 0;

  @override
  Widget build(BuildContext context) {
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
              listtiles(Icon(Icons.person), "Ver perfil", context, "/"),
              listtiles(Icon(Icons.category), "Crear categoria", context,
                  "/createnewcategory"),
              listtiles(Icon(Icons.search), "Ver categoria", context, "/"),
              SizedBox(
                height: 250,
              ),
              listtiles(Icon(Icons.logout), "Salir", context, "/")
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
      title: Text("mytext"),
    );
  }
}
