class CallCenterModel {
  late int id;
  late String name;
  late String phoneNumber;
  late String description;
  late String locationLink;
  late String image;

  CallCenterModel.fromJson(json){
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    description = json['description'];
    locationLink = json['location_link'];
    image = 'https://ofrlk.com/${json['image']}';
  }
}