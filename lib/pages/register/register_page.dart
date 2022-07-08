import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba/pages/register/register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegisterController con = Get.put(RegisterController());
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          height: 50,
          child: _textReg(),
        ),
        body: Stack(
          //poicicionar elemnetos uno encimna del otro
          children: [
            _backgroundCover(),
            _imageCover(),
            _imageicon(),
            _textAppName(),
            _boxform(context, con),
          ],
        ),
      ),
    );
  }

//COLOR DEL FONDO DE PANTALLA
  Widget _backgroundCover() {
    return Container(
      width: double.infinity,
      height: 800,
      color: Colors.white,
    );
  }

//TEXTO DEL REGISTRO
  Widget _textAppName() {
    return Positioned(
      top: 150,
      left: 50,
      child: Container(
          alignment: Alignment.center,
          child: const Text(
            'Crea una nueva cuenta',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )),
    );
  }

  Widget _textReg() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          '¿Ya tienes cuenta?',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        SizedBox(
          width: 7,
        ),
        Text(
          'Inicia Sesion',
          style: TextStyle(
            color: Color.fromARGB(255, 74, 97, 202),
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ],
    );
  }

//IMAGEN DEL REGISTRO
//metodo privado es: _raya al piso
  Widget _imageCover() {
    return Positioned(
      top: -55,
      left: -4,
      child: Container(
        alignment: Alignment.center,
        child: Image.asset(
          'assets/imageregister.png',
          height: 410,
        ),
      ),
    );
  }
}

Widget _imageicon() {
  return Positioned(
    top: -10,
    left: 100,
    child: Container(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/programador.png',
        height: 200,
      ),
    ),
  );
}

Widget _boxform(BuildContext context, RegisterController con) {
  return Container(
    height: MediaQuery.of(context).size.height * 145,
    margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.33, left: 50, right: 50),
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(children: [
        _textcorreo(con),
        _textpass(con),
        _textName(con),
        _textApe(con),
        _textphone(con),
        _textedad(con),
        _textres(con),
        _botonlogin(con)
      ]),
    ),
  );
}

Widget _textName(RegisterController con) {
  return TextField(
    controller: con.namectrl,
    keyboardType: TextInputType.text,
    decoration: const InputDecoration(
        hintText: 'Introduce tu Nombre', prefixIcon: Icon(Icons.person)),
  );
}

Widget _textApe(RegisterController con) {
  return TextField(
    controller: con.emailctrl,
    keyboardType: TextInputType.text,
    decoration: const InputDecoration(
        hintText: 'Introduce tu Apellido',
        prefixIcon: Icon(Icons.person_add_alt_1_outlined)),
  );
}

Widget _textcorreo(RegisterController con) {
  return TextField(
    controller: con.emailctrl,
    keyboardType: TextInputType.emailAddress,
    decoration: const InputDecoration(
        hintText: 'Ingresa un correo electronico',
        prefixIcon: Icon(Icons.email)),
  );
}

Widget _textpass(RegisterController con) {
  return TextField(
    controller: con.passwordctrl,
    obscureText: true,
    keyboardType: TextInputType.text,
    decoration: const InputDecoration(
        hintText: 'Ingresa una contraseña', prefixIcon: Icon(Icons.password)),
  );
}

Widget _textphone(RegisterController con) {
  return TextField(
    controller: con.phonectrl,
    keyboardType: TextInputType.number,
    decoration: const InputDecoration(
        hintText: 'Ingresa tu numero de telefono',
        prefixIcon: Icon(Icons.phone)),
  );
}

Widget _textedad(RegisterController con) {
  return TextField(
    controller: con.agectrl,
    keyboardType: TextInputType.number,
    decoration: const InputDecoration(
        hintText: 'Ingresa tu Edad', prefixIcon: Icon(Icons.numbers_sharp)),
  );
}

Widget _textres(RegisterController con) {
  return TextField(
    obscureText: true,
    controller: con.questionctrl,
    keyboardType: TextInputType.text,
    decoration: const InputDecoration(
        hintText: '¿Cual es tu color favorito?', prefixIcon: Icon(Icons.abc)),
  );
}

Widget _botonlogin(RegisterController con) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(
      horizontal: 40,
      vertical: 40,
    ),
    child: ElevatedButton(
        onPressed: () {
          con.registeruser();
        },
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15)),
        child: const Text(
          'REGISTRATE',
          style: TextStyle(color: Color.fromARGB(255, 235, 229, 236)),
        )),
  );
}
