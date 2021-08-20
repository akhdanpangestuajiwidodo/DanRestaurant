import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dan_resto/model/food.dart';

class FoodWidget extends StatelessWidget {
  final List<Food> foods;

  FoodWidget({required this.foods});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foods.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Chip(
            padding: EdgeInsets.all(0),
            backgroundColor: Colors.pinkAccent,
            label: Text(foods[index].name, style: TextStyle(color: Colors.white)),
          ),
        );
      },
    );
  }
}