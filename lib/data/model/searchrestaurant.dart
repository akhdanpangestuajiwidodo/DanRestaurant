import 'dart:convert';

import 'listrestaurant.dart';

SearchRestaurant searchRestaurantFromJson(String str) => SearchRestaurant.fromJson(json.decode(str));

String searchRestaurantToJson(SearchRestaurant data) => json.encode(data.toJson());

class SearchRestaurant {
  SearchRestaurant({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  bool error;
  int founded;
  List<ListRestaurant> restaurants;

  factory SearchRestaurant.fromJson(Map<String, dynamic> json) => SearchRestaurant(
    error: json["error"],
    founded: json["founded"],
    restaurants: List<ListRestaurant>.from(json["restaurants"].map((x) => ListRestaurant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "founded": founded,
    "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
  };
}