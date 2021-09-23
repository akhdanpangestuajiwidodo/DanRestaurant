import 'package:dan_resto/data/api/api_service.dart';
import 'package:dan_resto/data/model/restaurantresult.dart';
import 'package:flutter/cupertino.dart';

enum DetailState { Loading, NoHasData, HasData, HasError }

class DetailRestaurantProvider extends ChangeNotifier {
  final ApiServices apiService;
  final String id;

  RestaurantResult? _detailRestaurant;
  String? _message;
  DetailState? _state;

  DetailRestaurantProvider({required this.apiService, required this.id}) {
    _getDetailRestaurant(id);
  }

  RestaurantResult get detailRestaurant => _detailRestaurant!;
  String get message => _message!;
  DetailState get state => _state!;

  Future<dynamic> _getDetailRestaurant(String id) async {
    try {
      _state = DetailState.Loading;
      notifyListeners();

      final detailRestaurant = await apiService.getDetail(id);
      if (detailRestaurant.error) {
        _state = DetailState.NoHasData;
        notifyListeners();
      } else {
        _state = DetailState.HasData;
        notifyListeners();

        return _detailRestaurant = detailRestaurant;
      }
    } catch (e) {
      _state = DetailState.HasError;
      notifyListeners();

      return _message = e.toString();
    }
  }
}