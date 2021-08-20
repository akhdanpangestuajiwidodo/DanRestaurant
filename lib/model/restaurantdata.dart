import 'package:dan_resto/model/restaurant.dart';

class RestaurantData {
  late List<Restaurant> restaurants;


  RestaurantData(this.restaurants);

  RestaurantData.fromJson(Map<String, dynamic> json){
    if (json['restaurants'] != null) {
      restaurants = <Restaurant>[];
      json['restaurants'].forEach((v) {
        restaurants.add(new Restaurant.fromJson(v));
      });
    }
  }
}
