class TownsModel {
  late int id;
  late String name;

  TownsModel.fromJson(json){
    id = json['id'];
    name = json['name'];
  }
}