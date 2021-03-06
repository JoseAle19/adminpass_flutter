// ignore_for_file: prefer_const_declarations, sort_child_properties_last, avoid_print

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prueba/pages/login/login_controller.dart';

import '../../models/user.dart';
import 'helper_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showBiometric = false;
  bool isAuthenticated = false;
  @override
  void initState() {
    isBiometricsAvailable();
    super.initState();
  }

  isBiometricsAvailable() async {
    showBiometric = await BiometricHelper().hasEnrolledBiometrics();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    User myuser = User.fromJson(GetStorage().read("user") ?? {});
    //
    myuser.email == null
        ? print("No hay usuario")
        : print("Ya hay un usuario registrado");
    //end if
    LoginController con = Get.put(LoginController());
    final mycolor = const Color.fromARGB(255, 164, 125, 248);
    final sizescreen = MediaQuery.of(context).size;
    return SafeArea(
      child: SlideInLeft(
        child: Scaffold(
          bottomNavigationBar: SizedBox(
              height: 100, child: registernewuser(context, mycolor, con)),
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
                      desingbutton(
                          "Correo electronico",
                          const Icon(Icons.email),
                          TextInputType.emailAddress,
                          false,
                          con.emailctrl),
                      desingbutton(
                          "Contrase??a",
                          const Icon(Icons.password),
                          TextInputType.visiblePassword,
                          true,
                          con.passwordctrl),
                      Container(
                        margin: const EdgeInsets.only(right: 40),
                        alignment: Alignment.topRight,
                        height: 20,
                        // color: Colors.red,
                        child: Text(
                          "Olvidaste tu contrase??a",
                          textAlign: TextAlign.right,
                          style: TextStyle(color: mycolor),
                        ),
                      ),
                      button(mycolor, con, myuser),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget logo() {
    return Container(
      // color: Colors.red,
      margin: const EdgeInsets.only(left: 20, right: 20),
      height: 210,
      child: Image.asset(
        "assets/image2.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget button(mycolor, LoginController login, myuser) {
    return myuser.email != null
        ? enterbiometirc(login)
        : GestureDetector(
            onTap: () async {
              login.login();
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
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
  }

  Widget registernewuser(context, mycolor, LoginController goregister) {
    final mystyle = const TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 80,
        ),
        Text(
          "??No tienes cuenta?",
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
                fontSize: 12, fontWeight: FontWeight.bold, color: mycolor),
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

  Widget enterbiometirc(LoginController login) {
    return IconButton(
        onPressed: () async {
          isAuthenticated = await BiometricHelper().authenticate();
          setState(() {});
          if (isAuthenticated) {
            login.gotohomepage();
          }
        },
        icon: const Icon(Icons.fingerprint_outlined,
            size: 60, color: Color.fromARGB(255, 164, 125, 248)));
  }
}
