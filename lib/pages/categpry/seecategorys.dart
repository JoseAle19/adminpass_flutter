import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba/models/categorys.dart';
import 'package:prueba/pages/categpry/category_controller.dart';

class ListCategorys extends StatelessWidget {
  ListCategorys({Key? key}) : super(key: key);
  CategoryController concateg = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    CategoryController concate = Get.put(CategoryController());
    concate.getcategorys();
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
              return Listcateg(categ: snapshot.data!);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 92, 93, 94),
          onPressed: () {
            concate.gotocreatenoe();
          },
          child: const Icon(
            Icons.add_comment_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class Listcateg extends StatelessWidget {
  const Listcateg({Key? key, required this.categ}) : super(key: key);
  final List<DataCategory> categ;
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
            delay: Duration(seconds: index),
            child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                height: 70,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 91, 211, 230),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child:
                    Center(child: Text(categ[index].descriptionCategory ?? ""))),
          );
        },
      ),
    );
  }
}
