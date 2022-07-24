// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba/pages/note/note_controller.dart';

class UpdateNote extends StatelessWidget {
  UpdateNote({Key? key}) : super(key: key);
  NoteController connote = Get.put(NoteController());
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Actualizar nota"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            tiitlenote(),
            emailnote(),
            passnote(),
            TextButton(
                onPressed: () {
                  connote.updatenote(arg["id"], arg["category"]);
                },
                child: const Text(
                  "actualizar",
                ))
          ],
        ),
      ),
    );
  }

  Widget tiitlenote() {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: TextFormField(
        controller: connote.titlecrtl,
        decoration: const InputDecoration(
          hintText: "Titulo de la nota",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget emailnote() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: TextFormField(
        controller: connote.emailctrl,
        decoration: const InputDecoration(
          hintText: "Email   /N tarjeta",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget passnote() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: TextFormField(
        controller: connote.passwordctrl,
        decoration: const InputDecoration(
          hintText: "Contraseña   /Pin",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
