import 'package:dan_resto/data/api/api_service.dart';
import 'package:dan_resto/data/model/restaurantresults.dart';
import 'package:dan_resto/data/model/searchrestaurant.dart';
import 'package:flutter/cupertino.dart';

enum ResultState { Loading, NoHasData, HasData, HasError }

class RestaurantProvider extends ChangeNotifier {
  final ApiServices apiServices;
  RestaurantResults? _restaurant;
  SearchRestaurant? _searchRestaurant;
  String? _message;
  ResultState? _state;

  RestaurantProvider({required this.apiServices}){
    buildRestaurant();
  }

  RestaurantResults get restaurant => _restaurant!;
  SearchRestaurant get searchRestaurant => _searchRestaurant!;
  String get message => _message!;
  ResultState get state => _state!;

  void buildRestaurant() {
    _getList();
  }

  void buildSearchRestaurant(String query) {
    _getList(query: query);
  }

  void _getList({String? query}) {
    Future<dynamic> list;
    if (query == null) {
      list = _getListRestaurant();
    } else {
      list = _getSearchRestaurant(query);
    }

    list.then(
          (value) {
        if (query == null) {
          _restaurant = value;
        } else {
          _searchRestaurant = value;
        }
      },
    );
  }

  Future<dynamic> _getListRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();

      final restaurant = await apiServices.getList();

      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.NoHasData;
        notifyListeners();

        return _message = 'Data not found!';
      } else {
        _state = ResultState.HasData;
        notifyListeners();

        return _restaurant = restaurant;
      }
    } catch (e) {
      _state = ResultState.HasError;
      notifyListeners();

      return _message = 'Connection is lose';
    }
  }

  Future<dynamic> _getSearchRestaurant(String query) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();

      final searchRestaurant = await apiServices.searchRestaurant(query);
      if (searchRestaurant.restaurants.isEmpty) {
        _state = ResultState.NoHasData;
        notifyListeners();

        return _message = 'Restaurant is founded!';
      } else {
        _state = ResultState.HasData;
        notifyListeners();

        return _searchRestaurant = searchRestaurant;
      }
    } catch (e) {
      _state = ResultState.HasError;
      notifyListeners();

      return _message = 'Connection is lose';
    }
  }


}