// ignore_for_file: sort_child_properties_last, must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba/pages/categpry/category_controller.dart';

import '../../models/categorys.dart';

class Listcateg extends StatelessWidget {
  Listcateg({Key? key, required this.categ}) : super(key: key);
  final List<DataCategory> categ;

  CategoryController conhome = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blueGrey,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: categ.length,
        itemBuilder: (BuildContext context, int index) {
          return FadeInRight(
            delay: Duration(milliseconds: index),
            child: Dismissible(
              onResize: () {
                conhome.deletecategory(categ[index].idCategory, categ[index].idUsers);
              },
              background: Container(
                color: Colors.red,
                child: Center(
                  child: Text(
                      "Eliminar categoria ${categ[index].descriptionCategory}"),
                ),
              ),
              key: UniqueKey(),
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                height: 100,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 176, 175, 175),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: designcards(index),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                child: const Center(
                  child: Text("Eliminar"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget designcards(index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(categ[index].descriptionCategory ?? ""),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
            ),
            const SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: () {
                Get.snackbar("Titulo", categ[index].descriptionCategory ?? "",
                    duration: const Duration(seconds: 1));
              },
              icon: const Icon(
                Icons.edit,
              ),
            ),
          ],
        )
      ],
    );
  }
}
