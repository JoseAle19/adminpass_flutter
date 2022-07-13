import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba/pages/note/note_controller.dart';

class Notepage extends StatefulWidget {
  const Notepage({super.key});

  @override
  State<Notepage> createState() => _NotepageState();
}

class _NotepageState extends State<Notepage> {
  String? dropdownValue;

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
            fontSize: 25,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.note_add),
        ),
      ),
      body: Stack(
        //poicicionar elemnetos uno encimna del otro
        children: [
          _backgroundCover(),
          _boxform(context, connote),
          Column(
            children: const [
              //pocisionar uno debajo  del otro de manera vertical
            ],
          )
        ],
      ),
    );
  }

  Widget _backgroundCover() {
    return Container(
      width: double.infinity,
      height: 800,
      color: const Color.fromARGB(255, 187, 185, 185),
    );
  }

//COLOR DEL FONDO DE PANTALLA
  Widget _boxform(BuildContext context, connote) {
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
        child: Column(children: [
          Container(
            height: 30,
            margin: const EdgeInsets.only(left: 50, right: 50),
            child: _desplegable(),
          ),
          _texttitle(connote),
          _textdescription(connote),
        ]),
      ),
    );
  }

  Widget _desplegable() {
    return Container(
      alignment: Alignment.center,
      child: DropdownButton<String>(
        value: dropdownValue,
        hint: const Text('Seleccionar Categoria'),
        icon: const Icon(Icons.arrow_drop_down),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['Red', 'Green', 'Blue']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
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

Widget _textdescription(connote) {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 30),
      child: TextFormField(
        controller: connote.descripcrtl,
        cursorColor: const Color.fromARGB(255, 15, 15, 15),
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
            fillColor: Colors.white,
            labelText: 'Descripcion',
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))),
            prefixIcon: Icon(Icons.description)),
      ));
}

Widget _textedit(connote) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: () {
          connote.isvalid();
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
