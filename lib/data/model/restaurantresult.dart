import 'dart:convert';
import 'detailrestaurant.dart';

class RestaurantResult {
  RestaurantResult({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  bool error;
  String message;
  DetailRestaurant restaurant;

  factory RestaurantResult.fromJson(Map<String, dynamic> json) => RestaurantResult(
    error: json["error"],
    message: json["message"],
    restaurant: DetailRestaurant.fromJson(json["restaurant"]),
  );

  RestaurantResult restaurantResultFromJson(String str) => RestaurantResult.fromJson(json.decode(str));
}
