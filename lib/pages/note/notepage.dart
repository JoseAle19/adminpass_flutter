// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba/models/categorys.dart';
import 'package:prueba/pages/categpry/category_controller.dart';
import 'package:prueba/pages/homepage/home_controller.dart';
import 'package:prueba/pages/note/note_controller.dart';

class Notepage extends StatefulWidget {
  const Notepage({super.key});

  @override
  State<Notepage> createState() => _NotepageState();
}

class _NotepageState extends State<Notepage> {
  @override
  Widget build(BuildContext context) {
    NoteController connote = Get.put(NoteController());
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 50,
        child: _textedit(connote),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 93, 94),
        centerTitle: true,
        title: const Text(
          'Agregar Nota',
          style: TextStyle(
            color: Color.fromARGB(255, 235, 229, 229),
          ),
        ),
      ),
      body: Stack(
        children: [
          _boxform(context, connote),
          Column(
            children: const [],
          )
        ],
      ),
    );
  }

//COLOR DEL FONDO DE PANTALLA
  Widget _boxform(BuildContext context, NoteController connote) {
    return Container(
      padding: const EdgeInsets.all(
        15,
      ),
      height: MediaQuery.of(context).size.height * 145,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.10,
        left: 20,
        right: 25,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          Container(
            height: 30,
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: _desplegable(),
          ),
          _texttitle(connote),
          _textdescription(connote, "Email", connote.emailctrl),
          _textdescription(
              connote, "Contraseña de la cuenta", connote.passwordctrl),
        ]),
      ),
    );
  }

  Widget _desplegable() {
    CategoryController concate = Get.put(CategoryController());
    NoteController connote = Get.put(NoteController());

    // print(concate.item);
    return Container(
      alignment: Alignment.center,
      child: DropdownButton<String>(
        value: connote.valuedrop,
        hint: const Text('Seleccionar Categoria'),
        icon: const Icon(Icons.arrow_drop_down),
        onChanged: (String? newValue) {
          setState(() {
            connote.valuedrop = newValue!;
          });
        },
        items: concate.item.map(buildmenuitem).toList(),
      ),
    );
  }

  DropdownMenuItem<String> buildmenuitem(DataCategory e) {
    return DropdownMenuItem(
        value: e.descriptionCategory, child: Text(e.descriptionCategory ?? ""));
  }
}

Widget _texttitle(NoteController connote) {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 15),
      child: TextFormField(
        controller: connote.titlecrtl,
        cursorColor: const Color.fromARGB(255, 15, 15, 15),
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
            labelText: 'Titulo',
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))),
            prefixIcon: Icon(Icons.title)),
      ));
}

Widget _textdescription(
    connote, String label, TextEditingController typecontroller) {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 30),
      child: TextFormField(
        controller: typecontroller,
        cursorColor: const Color.fromARGB(255, 15, 15, 15),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            fillColor: Colors.white,
            labelText: label,
            filled: true,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))),
            prefixIcon: const Icon(Icons.description)),
      ));
}

Widget _textedit(NoteController connote) {
  HomePageController con = Get.put(HomePageController());
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: () {
          connote.createnote();
        },
        child: const Text(
          'Crear nota',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
      ),
      const SizedBox(
        width: 7,
      ),
    ],
  );
}
