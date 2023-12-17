
class CountriesModel {
  late int id;
  late String name;
  late String image;

  CountriesModel.fromJson( json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
