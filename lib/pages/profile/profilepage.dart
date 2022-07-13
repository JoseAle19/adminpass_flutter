import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prueba/models/user.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    User user = User.fromJson(GetStorage().read("user"));
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
          Positioned(
            left: 5,
            right: 5,
            child: _backgroundCover(context)),
          _boxform(context, user),
        ],
      ),
    );
  }

  Widget _backgroundCover(context){
    return const Icon(Icons.person_pin_circle_rounded, size: 90, color: Color.fromARGB(255, 92, 93, 94),);
  }

  Widget _boxform(BuildContext context, User user) {
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
              TextInputType.text, const Icon(Icons.person), user.name?? "", false,"Nombre"),
          desingtextfield(TextInputType.text,
              const Icon(Icons.person_add_alt_1_outlined), user.lastName??"", false, "Apellido"),
          desingtextfield(TextInputType.emailAddress, const Icon(Icons.person),
              user.email??"", false, "Correo electronico"),
          desingtextfield(
              TextInputType.text, const Icon(Icons.person),user.password??"", true, "Contraseña"),
          desingtextfield(
              TextInputType.phone, const Icon(Icons.person), user.phone??"", false,"Telefono"),
          desingtextfield(
              TextInputType.number, const Icon(Icons.person),user.age??"", false, "Edad"),
          desingtextfield(TextInputType.text, const Icon(Icons.person),
             user.answerques??"", true,"Color favorito"),
        ]),
      ),
    );
  }

  Widget desingtextfield(
      TextInputType keyboard, Widget myicon, String mytext, bool yesornot, String labeltext) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 15),
        child: TextFormField(
          obscureText: yesornot,
          // controller: typecontroller,
          cursorColor: const Color.fromARGB(255, 15, 15, 15),
          keyboardType: keyboard,
          decoration: InputDecoration(
            labelText: labeltext,
            hintText: mytext,
            fillColor: Colors.white,
            filled: true,
            border: const OutlineInputBorder(),
            prefixIcon: myicon,
          ),
        ));
  }

  Widget _textedit() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          child: const Text(
            'Editar Perfil',
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
}
