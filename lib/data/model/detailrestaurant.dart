import 'package:dan_resto/data/api/api_service.dart';
import 'category.dart';
import 'customerreview.dart';
import 'menus.dart';

class DetailRestaurant {
  DetailRestaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  String id;
  String name;
  String description;
  String city;
  String address;
  String pictureId;
  List<Category> categories;
  Menus menus;
  double rating;
  List<CustomerReview> customerReviews;

  factory DetailRestaurant.fromJson(Map<String, dynamic> json) => DetailRestaurant(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    city: json["city"],
    address: json["address"],
    pictureId: json["pictureId"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    menus: Menus.fromJson(json["menus"]),
    rating: json["rating"].toDouble(),
    customerReviews: List<CustomerReview>.from(json["customerReviews"].map((x) => CustomerReview.fromJson(x))),
  );

  String getImage() => ApiServices.urlImage + this.pictureId;

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "city": city,
    "address": address,
    "pictureId": pictureId,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "menus": menus.toJson(),
    "rating": rating,
    "customerReviews": List<dynamic>.from(customerReviews.map((x) => x.toJson())),
  };
}