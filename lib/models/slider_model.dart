class SliderModel {
  late String image;
  late int countryId;

  SliderModel.fromJson(json){
    image = json['image'];
    countryId = json['country_id'];
  }
}