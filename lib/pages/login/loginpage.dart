// ignore_for_file: prefer_const_declarations, sort_child_properties_last

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba/pages/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController con = Get.put(LoginController());
    final mycolor = const Color.fromARGB(255, 164, 125, 248);
    final sizescreen = MediaQuery.of(context).size;
    return SafeArea(
        child: SlideInLeft(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              child: circles(150, 150, mycolor),
              left: -75,
              top: -55,
            ),
            Positioned(
              child: circles(40, 40, mycolor),
              left: 120,
              top: 30,
            ),
            Positioned(
              child: circles(40, 40, mycolor),
              left: 30,
              top: 120,
            ),
            Container(
              // color: Colors.red,
              margin: EdgeInsets.only(
                  top: sizescreen.height * 0.2,
                  left: sizescreen.width * 0.1,
                  right: sizescreen.width * 0.1),
              height: sizescreen.height * 0.99,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    logo(),
                    desingbutton("Correo electronico", const Icon(Icons.email),
                        TextInputType.emailAddress, false, con.emailctrl),
                    desingbutton("Contraseña", const Icon(Icons.password),
                        TextInputType.visiblePassword, true, con.passwordctrl),
                    Container(
                      margin: const EdgeInsets.only(right: 40),
                      alignment: Alignment.topRight,
                      height: 20,
                      // color: Colors.red,
                      child: Text(
                        "Olvidaste tu contraseña",
                        textAlign: TextAlign.right,
                        style: TextStyle(color: mycolor),
                      ),
                    ),
                    button(mycolor, con),
                    registernewuser(context, mycolor, con)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget logo() {
    return Container(
      // color: Colors.red,
      margin: const EdgeInsets.only(left: 20, right: 20),
      height: 200,
      child: Image.asset(
        "assets/image2.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget button(mycolor, LoginController login) {
    return GestureDetector(
      onTap: () {
        login.login();
        print("pressed");
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 30, right: 30, top: 40),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: mycolor,
        ),
        child: const Text(
          "Iniciar sesion",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget registernewuser(context, mycolor, LoginController goregister) {
    final mystyle = const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 80,
        ),
        Text(
          "¿No tienes cuenta?",
          style: mystyle,
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            goregister.gotoregister();
          },
          child: Text(
            "Crear una cuenta nueva",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: mycolor),
          ),
        )
      ],
    );
  }

  Widget circles(double myheigth, double mywith, Color mycolor) {
    return Container(
      height: myheigth,
      width: mywith,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: mycolor,
      ),
    );
  }

  Widget desingbutton(String myhint, Widget myicon, TextInputType typetext,
      bool yesornot, TextEditingController mycontroller) {
    return Container(
      // height: 60,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      // color: Colors.red,
      child: TextFormField(
        controller: mycontroller,
        obscureText: yesornot,
        keyboardType: typetext,
        decoration: InputDecoration(
          hintText: myhint,
          icon: myicon,
        ),
      ),
    );
  }
}
