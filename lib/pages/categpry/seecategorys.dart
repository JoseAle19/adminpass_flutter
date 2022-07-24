// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba/pages/categpry/category_controller.dart';

import '../widgets/widget_categorys.dart';

class ListCategorys extends StatelessWidget {
  ListCategorys({Key? key}) : super(key: key);
  CategoryController concateg = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    CategoryController concate = Get.put(CategoryController());
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 92, 93, 94),
            title: const Text("Mis categorias"),
            centerTitle: true,
          ),
          body: FutureBuilder(
            future: concate.getcategorys(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return snapshot.data.length == 0
                    ? notData()
                    : Listcateg(categ: snapshot.data!);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          floatingActionButton: buttonCreateNote(concate)),
    );
  }

  Widget notData() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Sin categorias, Crea nuevas categorias",
            style: TextStyle(fontSize: 20),
          ),
          Icon(
            Icons.error_outline,
            color: Colors.orange,
            size: 100,
          )
        ],
      ),
    );
  }

  Widget buttonCreateNote(concate) {
    return FloatingActionButton(
      backgroundColor: const Color.fromARGB(255, 92, 93, 94),
      onPressed: () {
        concate.gotocreatenote();
      },
      child: const Icon(
        Icons.add_comment_rounded,
        color: Colors.white,
      ),
    );
  }
}
