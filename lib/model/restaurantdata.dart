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

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      if (this.restaurants != null) {
        data['restaurants'] = this.restaurants.map((v) => v.toJson()).toList();
      }
      return data;
    }
  }
}
