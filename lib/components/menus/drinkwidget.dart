import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dan_resto/model/drink.dart';

class DrinkWidget extends StatelessWidget {
  final List<Drink> drinks;

  DrinkWidget({required this.drinks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: drinks.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Chip(
            padding: EdgeInsets.all(0),
            backgroundColor: Colors.deepOrange,
            label: Text(drinks[index].name, style: TextStyle(color: Colors.white)),
          ),
        );
      },
    );
  }
}