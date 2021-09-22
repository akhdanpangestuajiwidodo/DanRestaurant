import 'package:dan_resto/data/model/listrestaurant.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('Parsing json',() async{
    var restaurant = {
      "id": "s1knt6za9kkfw1e867",
      "name": "Kafe Kita",
      "description": "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. ...",
      "pictureId": "25",
      "city": "Gorontalo",
      "rating": 4,
    };
    var parseRestaurant = ListRestaurant.fromJson(restaurant);
    var result = parseRestaurant is ListRestaurant;
    
    expect(result, true);
  });
}