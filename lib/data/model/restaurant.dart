import 'dart:convert';
import 'menu.dart';
import 'restaurantdata.dart';

class Restaurant{
  late String id;
  late String name;
  late String description;
  late String urlPicture;
  late String city;
  late String rating;
  late Menu menu;

  Restaurant(
      {required this.id,
      required this.name,
      required this.description,
      required this.urlPicture,
      required this.city,
      required this.rating,
      required this.menu
      });

  Restaurant.fromJson(Map<String, dynamic> restaurant){
    id = restaurant['id'];
    name = restaurant['name'];
    description = restaurant['description'];
    urlPicture = restaurant['pictureId'];
    city = restaurant['city'];
    rating = restaurant['rating'].toString();
    menu = (restaurant['menus'] != null ? new Menu.fromJson(restaurant['menus']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['pictureId'] = this.urlPicture;
    data['city'] = this.city;
    data['rating'] = this.rating;
    data['menu'] = this.menu.toJson();
    return data;
  }

}

List<Restaurant>parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }

  final Map<String, dynamic> parsedJson = jsonDecode(json);
  return RestaurantData.fromJson(parsedJson).restaurants;
}






