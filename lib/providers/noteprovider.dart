// ignore_for_file: prefer_interpolation_to_compose_strings, unnecessary_brace_in_string_interps

import 'package:get/get.dart';
import 'package:prueba/models/notemodel.dart';

import '../enviroments/enviroments.dart';

class NoteProvider extends GetConnect {
  final url = Enviroments.MY_API;

  Future<Response> crearenote(Note note, String id) async {
    Response response = await post(url + "/note/addnote/${id}", note.toJson(),
        headers: {
          "Content-Type": "application/json"
        }); //Esoera hasta que el servidor de node retorne un valor
    return response;
  }

  Future<Response> updatenote(Note note, String id, String idnote) async {
    Response response = await put(url + "/note/update/${id}/${idnote}", note.toJson(),
        headers: {
          "Content-Type": "application/json"
        }); //Esoera hasta que el servidor de node retorne un valor
    return response;
  }
}
