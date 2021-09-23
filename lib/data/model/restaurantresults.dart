import 'dart:convert';
import 'package:dan_resto/data/model/listrestaurant.dart';

class RestaurantResults {
  RestaurantResults({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  bool error;
  String message;
  int count;
  List<ListRestaurant> restaurants;

  factory RestaurantResults.fromJson(Map<String, dynamic> json) => RestaurantResults(
    error: json["error"],
    message: json["message"],
    count: json["count"],
    restaurants: List<ListRestaurant>.from(json["restaurants"]
        .map((x) => ListRestaurant.fromJson(x))
    ),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "count": count,
    "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
  };

  RestaurantResults restaurantResultsFromJson(String str) => RestaurantResults.fromJson(json.decode(str));

}
