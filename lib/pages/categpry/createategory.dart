import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba/pages/categpry/category_controller.dart';

class CreateNewCatetgory extends StatelessWidget {
  const CreateNewCatetgory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryController concateg = Get.put(CategoryController());
    return SafeArea(
      child: SlideInRight(
        child: Scaffold(
          bottomNavigationBar: Container(
            // color: Colors.amber,
            height: 70,
            child: Center(
              child: GestureDetector(
                child: const Text(
                  "Agregar categoria",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  concateg.addcategory();
                },
              ),
            ),
          ),
          appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 92, 93, 94),
              title: const Text("Agregar nueva categoria"),
              centerTitle: true),
          body: Container(
            alignment: Alignment.center,
            height: 70,
            margin: const EdgeInsets.only(left: 10, right: 10, top: 50),
            // color: Colors.red,
            child: TextFormField(
              controller: concateg.categoryctrl,
              decoration: const InputDecoration(
                hintText: "Nombre de la categoria",
                labelText: "Categoria",
                icon: Icon(Icons.category),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
