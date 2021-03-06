// ignore_for_file: unnecessary_null_comparison

class DataCategorys {
  List<DataCategory> itemcategorys = [];

  DataCategorys.jsonFromList(List<dynamic> jsonlist) {
    if (jsonlist == null) return;

    for (var item in jsonlist) {
      final categ = DataCategory.fromJsonMap(item);
      itemcategorys.add(categ);
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
