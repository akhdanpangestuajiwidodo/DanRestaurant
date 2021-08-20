import 'package:dan_resto/components/menus/foodwidget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dan_resto/model/restaurant.dart';
import 'package:dan_resto/components/button/dynamicbutton.dart';
import 'package:dan_resto/components/menus/drinkwidget.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/article_screen';

  final Restaurant restaurant;

  const DetailScreen({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SafeArea(
              child: Stack(
                children: [
                  Image.network(restaurant.urlPicture),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: CircleAvatar(
                        backgroundColor: Color(0xff6B45BC),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                restaurant.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.star),
                      SizedBox(height: 8.0),
                      Text(
                        restaurant.rating,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.location_on),
                      SizedBox(height: 8.0),
                      Text(
                        restaurant.city,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    Text(
                      restaurant.description,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Oxygen',
                      ),
                    ),
                  ],
                )),
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Text(
                'List of Menu',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Text(
                'Drinks',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.deepOrange,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              height: 50,
              child: DrinkWidget(
                drinks: restaurant.menu.drinks,
              ),
            ),
            SizedBox(
              height: 14.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Text(
                'Foods',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.deepOrange,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              height: 50,
              child: FoodWidget(
                foods: restaurant.menu.foods,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              width: 10,
              child: DynamicButton(restaurant: restaurant),
            ),
          ],
        ),
      ),
    );
  }
}
