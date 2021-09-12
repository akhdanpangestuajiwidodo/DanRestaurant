import 'dart:convert';
import 'package:dan_resto/data/model/restaurantresults.dart';
import 'package:dan_resto/data/model/restaurantresult.dart';
import 'package:dan_resto/data/model/reviewresult.dart';
import 'package:dan_resto/data/model/searchrestaurant.dart';
import 'package:http/http.dart' as http;

class ApiServices{
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static final String urlImage = 'https://restaurant-api.dicoding.dev/images/small/';

  Future<RestaurantResults> getList() async {
    final response = await http.get(Uri.parse(_baseUrl + 'list'));
    if (response.statusCode == 200) {
      return RestaurantResults.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load list restaurant');
    }
  }

  Future<RestaurantResult> getDetail(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + 'detail/$id'));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load detail restaurant');
    }
  }

  Future<ReviewResult> addReview(String id, String name, String review) async {
    final response = await http.post(
      Uri.parse(_baseUrl + 'review'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'X-Auth-Token': '12345'
      },
      body: {
        'id': id,
        'name': name,
        'review': review
      },
    );

    final jsonObject = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return ReviewResult.fromJson(jsonObject);
    } else {
      print(response.statusCode);
      throw Exception('Add Review is Failed');
    }
  }

  Future<SearchRestaurant> searchRestaurant(String query) async {
    final response = await http.get(Uri.parse(_baseUrl + 'search?q=' + query));
    final jsonObject = jsonDecode(response.body);
    print("Status search ${response.statusCode}");
    if (response.statusCode == 200) {
      return SearchRestaurant.fromJson(jsonObject);
    } else {
      throw Exception('Search Restaurant is Failed');
    }
  }

}