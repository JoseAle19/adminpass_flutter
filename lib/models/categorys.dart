class DataCategorys {
  List<DataCategory> itemcategorys = [];

  DataCategorys.jsonFromList(List<dynamic> jsonlist) {
    if (jsonlist == null) return;

    for (var item in jsonlist) {
      final pelicula = DataCategory.fromJsonMap(item);
      itemcategorys.add(pelicula);
    }
  }
}

class DataCategory {
  DataCategory({
    this.idCategory,
    this.descriptionCategory,
    this.idUsers,
  });

  String? idCategory;
  String? descriptionCategory;
  String? idUsers;

  DataCategory.fromJsonMap(Map<String, dynamic> json) {
    idCategory = json["id_Category"].toString();
    descriptionCategory = json["Description_category"];
    idUsers = json["id_users"].toString();
  }
}
