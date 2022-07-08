import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CreateNewCatetgory extends StatelessWidget {
  const CreateNewCatetgory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SlideInRight(
        child: Scaffold(
          appBar: AppBar(
              title: const Text("Agregar nueva categoria"), centerTitle: true),
        ),
      ),
    );
  }
}
