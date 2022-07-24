// ignore_for_file: unnecessary_null_comparison

class DataNotes {
  List<DataNote> itemnotes = [];

  DataNotes.jsonFromList(List<dynamic> jsonlist) {
    if (jsonlist == null) return;

    for (var item in jsonlist) {
      final note = DataNote.fromJsonMap(item);
      itemnotes.add(note);
      
    }
  }
}

class DataNote {
  DataNote({
    this.idNote,
    this.tittle,
    this.email,
    this.password,
    this.typecategory,
  });
  String? idNote;

  String? tittle;
  String? email;
  String? password;
  String? typecategory;

  DataNote.fromJsonMap(Map<String, dynamic> json) {
    idNote = json["id_note"].toString();
    tittle = json["tittle"].toString();
    email = json["email"];
    password = json["password"].toString();
    typecategory = json["typecategory"];
  }
}
