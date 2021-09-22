import 'package:dan_resto/data/db/databasehelper.dart';
import 'package:dan_resto/data/model/listrestaurant.dart';
import 'package:flutter/cupertino.dart';

enum DbState { Loading, HasData, NoHasData, HasError }

class DatabaseProvider extends ChangeNotifier{

  final DatabaseHelper databaseHelper;

  DatabaseProvider({required this.databaseHelper}){
    _getFavorite();
  }

  late DbState _state;
  DbState get state => _state;

  String? _message;
  String get message => _message!;

  List<ListRestaurant>? _favRestaurant = [];
  List<ListRestaurant> get favRestaurant => _favRestaurant!;

  Future<dynamic> _getFavorite() async {
    try {
      _state = DbState.Loading;
      notifyListeners();

      _favRestaurant = await databaseHelper.getFavorite();

      if (_favRestaurant!.isEmpty) {
        _state = DbState.NoHasData;
        notifyListeners();

        return _message = 'Favorite Restaurant is empty';
      } else {
        _state = DbState.HasData;
        notifyListeners();

        return _favRestaurant = favRestaurant;
      }
    } catch (e) {
      _state = DbState.HasError;
      notifyListeners();

      return _message = 'Favorite Restaurant is empty';
    }
  }

  void addFavorite(ListRestaurant restaurant) async {
    try {
      await databaseHelper.addFavorite(restaurant);
      _getFavorite();
    } catch (e) {
      _state = DbState.HasError;
      _message = 'Connection is lose';
      print(e.toString());
      notifyListeners();
    }
  }

  Future<bool> isFavorite(String id) async {
    final favoriteRestaurant = await databaseHelper.getFavoriteById(id);
    return favoriteRestaurant.isNotEmpty;
  }

  void deleteFavorite(String id) async {
    try {
      await databaseHelper.deleteFavorite(id);
      _getFavorite();
    } catch (e) {
      _state = DbState.HasError;
      _message = 'Connection is lose';
      notifyListeners();
    }
  }

}