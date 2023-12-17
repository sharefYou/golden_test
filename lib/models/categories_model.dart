class CategoriesModel {
  late int id;
  late String name;
  late String image;

  CategoriesModel.fromJson(json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}