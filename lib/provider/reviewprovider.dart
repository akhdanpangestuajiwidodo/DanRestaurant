import 'package:dan_resto/data/api/api_service.dart';
import 'package:dan_resto/data/model/reviewresult.dart';
import 'package:flutter/cupertino.dart';

enum ReviewState { Loading, NoHasData, HasData, HasError }

class ReviewProvider extends ChangeNotifier {
  final ApiServices apiService;

  ReviewResult? _customerReview;
  String? _message;
  ReviewState? _state;

  ReviewProvider({required this.apiService,});

  ReviewResult get customerReview => _customerReview!;
  String get message => _message!;
  ReviewState get state => _state!;

  Future<dynamic> addReview(String id, String name, String review) async {
    try {
      _state = ReviewState.Loading;
      notifyListeners();

      final customerReview = await apiService.addReview(id, name, review);

      if (customerReview.customerReviews.isEmpty) {
        _state = ReviewState.NoHasData;
        notifyListeners();

        return _message = 'No Any Review';

      } else {
        _state = ReviewState.HasData;
        notifyListeners();

        return _customerReview = customerReview;
      }
    } catch (e) {
      _state = ReviewState.HasError;
      notifyListeners();

      return _message = e.toString();
    }
  }

}