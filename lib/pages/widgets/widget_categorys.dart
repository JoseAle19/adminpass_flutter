import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/categorys.dart';

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
            delay: Duration(milliseconds: index),
            child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                height: 100,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 176, 175, 175),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: designcards(index)),
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
