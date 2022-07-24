// ignore_for_file: must_be_immutable, override_on_non_overriding_member, annotate_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prueba/models/user.dart';
import 'package:prueba/pages/profile/profile_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileController conprofile = Get.put(ProfileController());

  @override
  User myuser = User.fromJson(GetStorage().read("user") ?? {});
  void initState() {
    conprofile.emailctrl.text = myuser.email ?? "";
    conprofile.namectrl.text = myuser.name ?? "";
    conprofile.lastnamectrl.text = myuser.lastName ?? "";
    conprofile.passwordctrl.text = myuser.password ?? "";
    conprofile.phonectrl.text = myuser.phone ?? "";
    conprofile.agectrl.text = myuser.age ?? "";
    conprofile.answerquesctrl.text = myuser.answerques ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 50,
        child: _textedit(),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 93, 94),
        centerTitle: true,
        title: const Text(
          'Mi Perfil',
          style: TextStyle(
            color: Color.fromARGB(255, 32, 31, 31),
            fontSize: 17,
          ),
        ),
      ),
      body: Stack(
        //poicicionar elemnetos uno encimna del otro
        children: [
          Positioned(left: 5, right: 5, child: _backgroundCover(context)),
          _boxform(context),
        ],
      ),
    );
  }

  Widget _backgroundCover(context) {
    return const Icon(
      Icons.person_pin_circle_rounded,
      size: 90,
      color: Color.fromARGB(255, 92, 93, 94),
    );
  }

  Widget _boxform(BuildContext context) {
    return Container(
      // color: Colors.red,
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
          desingtextfield(
              TextInputType.emailAddress,
              const Icon(Icons.person),
              conprofile.emailctrl,
              false,
              "Correo electronico",
              false,
              myuser.email ?? ""),
          desingtextfield(TextInputType.text, const Icon(Icons.person),
              conprofile.namectrl, false, "Nombre", true, myuser.name ?? ""),
          desingtextfield(
              TextInputType.text,
              const Icon(Icons.person_add_alt_1_outlined),
              conprofile.lastnamectrl,
              false,
              "Apellido",
              true,
              myuser.lastName ?? ""),
          desingtextfield(
              TextInputType.text,
              const Icon(Icons.person),
              conprofile.passwordctrl,
              true,
              "Contraseña",
              true,
              myuser.password ?? ""),
          desingtextfield(
              TextInputType.phone,
              const Icon(Icons.person),
              conprofile.phonectrl,
              false,
              "Telefono",
              true,
              myuser.phone ?? ""),
          desingtextfield(TextInputType.number, const Icon(Icons.person),
              conprofile.agectrl, false, "Edad", true, myuser.age ?? ""),
          desingtextfield(
              TextInputType.text,
              const Icon(Icons.person),
              conprofile.answerquesctrl,
              true,
              "Color favorito",
              true,
              myuser.answerques ?? ""),
        ]),
      ),
    );
  }

  Widget desingtextfield(
      TextInputType keyboard,
      Widget myicon,
      TextEditingController typecontroller,
      bool yesornot,
      String labeltext,
      bool iseneable,
      String datauser) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 15),
        child: TextFormField(
          enabled: iseneable,
          obscureText: yesornot,
          controller: typecontroller,
          cursorColor: const Color.fromARGB(255, 15, 15, 15),
          keyboardType: keyboard,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  typecontroller.text = "";
                },
                icon: const Icon(Icons.backspace)),
            labelText: labeltext,
            hintText: datauser,
            fillColor: Colors.white,
            filled: true,
            border: const OutlineInputBorder(),
            prefixIcon: myicon,
          ),
        ));
  }

  Widget _textedit() {
    return Container(
      color: const Color.fromARGB(221, 162, 157, 157),
      child: TextButton(
          onPressed: () {
            conprofile.Updateuser();
          },
          child: const Text(
            "Actualizar datos",
            style:
                TextStyle(fontSize: 20, color: Color.fromARGB(255, 15, 15, 15)),
          )),
    );
  }
}
