import 'package:dan_resto/common/navigation.dart';
import 'package:dan_resto/data/model/listrestaurant.dart';
import 'package:dan_resto/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class CardRestaurant extends StatelessWidget {
  final ListRestaurant restaurant;

  const CardRestaurant({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          padding: EdgeInsets.only(left: 10),
          margin: EdgeInsets.only(bottom: 20),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(8.0),
                  child: Hero(
                    tag: restaurant.getImageId(),
                    child: Image.network(restaurant.getImageId()),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        restaurant.name,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Location : ${restaurant.city}",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Rating : ${restaurant.rating}"),
                      SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigation.intentWithData(DetailScreen.routeName, restaurant.id);
                        },
                        child: Text(
                          "Detail",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color(0xffFEDE04),
                          side: BorderSide(color: Color(0xffFEDE04), width: 0),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 9,
                offset: Offset(
                    0, 0), // changes position of shadow
              ),
            ],
          ),
        ),
      )
    );
  }
}