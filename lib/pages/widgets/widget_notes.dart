// ignore_for_file: override_on_non_overriding_member

import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba/models/notes.dart';
import 'package:prueba/pages/homepage/home_controller.dart';
import 'package:prueba/pages/note/note_controller.dart';
import 'package:prueba/utils/colors_cards.dart';

import '../login/helper_auth.dart';

class ListNote extends StatefulWidget {
  const ListNote({
    super.key,
    required this.note,
  });
  final List<DataNote> note;

  @override
  State<ListNote> createState() => _ListNoteState();
}

class _ListNoteState extends State<ListNote> {
  HomePageController conhome = Get.put(HomePageController());
  @override
  NoteController connote = Get.put(NoteController());

  bool islistorgrid = false;
  bool az = false;
  bool isAuthenticated = false;
  bool showBiometric = false;
  bool seepassword = false;

  @override
  void initState() {
    isBiometricsAvailable();
    widget.note.sort(
      (a, b) => a.tittle!.toUpperCase().compareTo(
            b.tittle!.toUpperCase(),
          ),
    );

    super.initState();
  }

  isBiometricsAvailable() async {
    showBiometric = await BiometricHelper().hasEnrolledBiometrics();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(persistentFooterButtons: [
      IconButton(
        onPressed: () {
          setState(() {
            islistorgrid = !islistorgrid;
          });
        },
        icon: const Icon(Icons.compare_arrows_outlined),
      ),
      IconButton(
        onPressed: () {
          setState(() {
            conhome.getnotes();

            az = !az;
            (az)
                ? widget.note.sort(
                    (a, b) => a.tittle!.toUpperCase().compareTo(
                          b.tittle!.toUpperCase(),
                        ),
                  )
                : widget.note.sort(
                    (b, a) => a.tittle!.toUpperCase().compareTo(
                          b.tittle!.toUpperCase(),
                        ),
                  );
          });
        },
        icon: (az)
            ? const Icon(Icons.sort_by_alpha)
            : const Icon(
                Icons.sort_by_alpha_rounded,
                color: Colors.blue,
              ),
      ),
    ], body: (islistorgrid) ? listviewsdta() : gridviewsdta());
  }

  Widget listviewsdta() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: widget.note.length,
      itemBuilder: (BuildContext context, int index) {
        return designcards(index);
      },
    );
  }

  Widget gridviewsdta() {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 250,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      itemCount: widget.note.length,
      itemBuilder: (BuildContext context, int index) {
        return designcardsgrid(index);
      },
    );
  }

  Widget designcardsgrid(index) {
    return FadeInLeftBig(
      delay: Duration(milliseconds: index),
      child: Container(
        decoration: BoxDecoration(
            color: mycolors[Random().nextInt(mycolors.length)],
            borderRadius: BorderRadiusDirectional.circular(15),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(93, 19, 18, 18),
                  blurRadius: 5,
                  offset: Offset(2, 0)),
            ]),
        width: 40,
        margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
        child: Container(
          // color: Colors.yellow,
          margin: const EdgeInsets.all(2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              texts("Titulo  \n", widget.note[index].tittle ?? ""),
              texts("Correo /N tarjeta  \n", widget.note[index].tittle ?? ""),
              texts("Contraseña /Pin  \n", "xxxxxxx"),
              seepass(index),
              updatenote(
                widget.note[index].tittle ?? "",
                widget.note[index].email ?? "",
                widget.note[index].password ?? "",
                widget.note[index].idNote ?? "",
                widget.note[index].typecategory ?? "",
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget texts(String firstittle, String secondtittle) {
    return Text.rich(
      TextSpan(
        text: firstittle,
        style: const TextStyle(fontSize: 15),
        children: [
          TextSpan(
              text: secondtittle,
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget designcards(index) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (di) {
        connote.deletenote(widget.note[index].idNote);
      },
      key: UniqueKey(),
      child: FadeInLeftBig(
        delay: Duration(milliseconds: index),
        child: Container(
          height: 200,
          margin: const EdgeInsets.only(left: 2, right: 2, top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: mycolors[Random().nextInt(mycolors.length)],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text("Titulo: ${widget.note[index].tittle ?? ""}"),
              ),
              Center(
                child: Text("Correo: ${widget.note[index].email ?? ""}"),
              ),
              const Center(
                child: Text(
                  "Contraseña: xxxxx",
                ),
              ),
              seepass(index),
              updatenote(
                widget.note[index].tittle ?? "",
                widget.note[index].email ?? "",
                widget.note[index].password ?? "",
                widget.note[index].idNote ?? "",
                widget.note[index].typecategory ?? "",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget seepass(index) {
    return InkWell(
      onTap: () async {
        isAuthenticated = await BiometricHelper().authenticate();
        if (isAuthenticated) {
          Get.snackbar("Tu contraseña", widget.note[index].password ?? "",
              backgroundColor: const Color.fromARGB(181, 52, 251, 59),
              duration: const Duration(seconds: 5));
        } else {
          Get.snackbar("Error", "No tienes permisos para ver la contraseña",
              backgroundColor: const Color.fromARGB(191, 232, 59, 46),
              duration: const Duration(seconds: 5));
        }
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        height: 30,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        // color: Colors.red,
        child: const Text(
          "Ver contraseña",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget updatenote(
      String title, String email, String password, String id, String category) {
    return IconButton(
        onPressed: () {
          Navigator.pushNamed(context, "/noteupdate", arguments: {
            "id": id,
            "tittle": title,
            "email": email,
            "password": password,
            "category": category
          });
        },
        icon: const Icon(Icons.edit_calendar_sharp));
  }
}
